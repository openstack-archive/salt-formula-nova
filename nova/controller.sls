{% from "nova/map.jinja" import controller with context %}

{%- if controller.enabled %}

{%- if grains.os_family == 'Debian' %}
debconf-set-prerequisite:
    pkg.installed:
      - name: debconf-utils
      - require_in:
        - debconf: nova_consoleproxy_debconf

nova_consoleproxy_debconf:
  debconf.set:
  - name: nova-consoleproxy
  - data:
      'nova-consoleproxy/daemon_type':
        type: 'string'
        value: 'novnc'
  - require_in:
    - pkg: nova_controller_packages
{%- endif %}

nova_controller_packages:
  pkg.installed:
  - names: {{ controller.pkgs }}

{%- if not salt['user.info']('nova') %}
user_nova:
  user.present:
  - name: nova
  - home: /var/lib/nova
  - shell: /bin/false
  - uid: 303
  - gid: 303
  - system: True
  - require_in:
    - pkg: nova_controller_packages

group_nova:
  group.present:
    - name: nova
    - gid: 303
    - system: True
    - require_in:
      - user: user_nova
{%- endif %}

{%- if controller.get('networking', 'default') == "contrail" and controller.version == "juno" %}

contrail_nova_packages:
  pkg.installed:
  - names:
    - contrail-nova-driver
    - contrail-nova-networkapi

{%- endif %}

/etc/nova/nova.conf:
  file.managed:
  - source: salt://nova/files/{{ controller.version }}/nova-controller.conf.{{ grains.os_family }}
  - template: jinja
  - require:
    - pkg: nova_controller_packages

/etc/nova/api-paste.ini:
  file.managed:
  - source: salt://nova/files/{{ controller.version }}/api-paste.ini.{{ grains.os_family }}
  - template: jinja
  - require:
    - pkg: nova_controller_packages

{%- for name, rule in controller.get('policy', {}).iteritems() %}

{%- if rule != None %}
rule_{{ name }}_present:
  keystone_policy.rule_present:
  - path: /etc/nova/policy.json
  - name: {{ name }}
  - rule: {{ rule }}
  - require:
    - pkg: nova_controller_packages

{%- else %}

rule_{{ name }}_absent:
  keystone_policy.rule_absent:
  - path: /etc/nova/policy.json
  - name: {{ name }}
  - require:
    - pkg: nova_controller_packages

{%- endif %}

{%- endfor %}

{%- if not grains.get('noservices', False) %}

{%- if controller.version in ["mitaka", "newton", "ocata"] %}
nova_controller_sync_apidb:
  cmd.run:
  - name: nova-manage api_db sync
  - require:
    - file: /etc/nova/nova.conf
{%- endif %}

{%- if controller.version in ["newton", "ocata"] %}
nova_controller_online_data_migrations:
  cmd.run:
  - name: nova-manage db online_data_migrations
{%- endif %}

nova_controller_syncdb:
  cmd.run:
  - names:
    - nova-manage db sync
  - require:
    - file: /etc/nova/nova.conf

{%- if controller.version in ["ocata"] %}

nova_controller_map_cell0:
  cmd.run:
  - name: nova-manage cell_v2 map_cell0
  - require:
    - cmd: nova_controller_sync_apidb
  - require_in:
    - cmd: nova_controller_syncdb

nova_cell1_create:
  cmd.run:
  - name: nova-manage cell_v2 create_cell --name=cell1
  - unless: 'nova-manage cell_v2 list_cells | grep cell1'
  - require:
    - cmd: nova_controller_sync_apidb
  - require_in:
    - cmd: nova_controller_syncdb

nova_placement_service_mask:
  file.symlink:
   - name: /etc/systemd/system/nova-placement-api.service
   - target: /dev/null

nova_placement_package:
  pkg.installed:
  - name: nova-placement-api
  - require:
    - file: nova_placement_service_mask

/etc/apache2/sites-available/nova-placement-api.conf:
  file.managed:
  - source: salt://nova/files/{{ controller.version }}/nova-placement-api.conf
  - template: jinja
  - require:
    - pkg: nova_controller_packages
    - pkg: nova_placement_package

placement_config:
  file.symlink:
     - name: /etc/apache2/sites-enabled/nova-placement-api.conf
     - target: /etc/apache2/sites-available/nova-placement-api.conf

nova_apache_restart:
  service.running:
  - enable: true
  - name: apache2
  - require:
    - cmd: nova_controller_syncdb
  - watch:
    - file: /etc/nova/nova.conf
    - file: /etc/nova/api-paste.ini
    - file: /etc/apache2/sites-available/nova-placement-api.conf

{%- endif %}

nova_controller_services:
  service.running:
  - enable: true
  - names: {{ controller.services }}
  - require:
    - cmd: nova_controller_syncdb
  - watch:
    - file: /etc/nova/nova.conf
    - file: /etc/nova/api-paste.ini

{%- endif %}

{%- if grains.get('virtual_subtype', None) == "Docker" %}

nova_entrypoint:
  file.managed:
  - name: /entrypoint.sh
  - template: jinja
  - source: salt://nova/files/entrypoint.sh
  - mode: 755

{%- endif %}

{%- endif %}
