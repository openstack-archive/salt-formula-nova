{% from "nova/map.jinja" import controller with context %}

{%- if controller.get('enabled') %}

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

{% if controller.get('policy', {}) and controller.version not in ['liberty', 'mitaka', 'newton'] %}
{# nova no longer ships with a default policy.json #}

/etc/nova/policy.json:
  file.managed:
    - contents: '{}'
    - replace: False
    - user: nova
    - group: nova
    - require:
      - pkg: nova_controller_packages

{% endif %}

{%- for name, rule in controller.get('policy', {}).iteritems() %}

{%- if rule != None %}
rule_{{ name }}_present:
  keystone_policy.rule_present:
  - path: /etc/nova/policy.json
  - name: {{ name }}
  - rule: {{ rule }}
  - require:
    - pkg: nova_controller_packages
    {% if controller.version not in ['liberty', 'mitaka', 'newton'] %}
    - file: /etc/nova/policy.json
    {% endif%}

{%- else %}

rule_{{ name }}_absent:
  keystone_policy.rule_absent:
  - path: /etc/nova/policy.json
  - name: {{ name }}
  - require:
    - pkg: nova_controller_packages
    {% if controller.version not in ['liberty', 'mitaka', 'newton'] %}
    - file: /etc/nova/policy.json
    {% endif%}

{%- endif %}

{%- endfor %}

{%- if controller.version in ["ocata"] %}

{#- the following api_db sync --version 20 happens only if the current api_db version is < 20 #}

nova_controller_api_db_sync_version_20:
  novang.api_db_version_present:
  - version: "20"
  {%- if grains.get('noservices') %}
  - onlyif: /bin/false
  {%- endif %}
  - require:
    - file: /etc/nova/nova.conf

{#- the following db sync --version 334 happens only if the current db version is < 334 #}

nova_controller_db_sync_version_334:
  novang.db_version_present:
  - version: "334"
  {%- if grains.get('noservices') %}
  - onlyif: /bin/false
  {%- endif %}
  - require:
    - file: /etc/nova/nova.conf

nova_controller_map_cell0:
  cmd.run:
  - name: nova-manage cell_v2 map_cell0
  {%- if grains.get('noservices') %}
  - onlyif: /bin/false
  {%- endif %}

nova_cell1_create:
  cmd.run:
  - name: nova-manage cell_v2 create_cell --name=cell1
  {%- if grains.get('noservices') %}
  - onlyif: /bin/false
  {%- endif %}
  - unless: 'nova-manage cell_v2 list_cells | grep cell1'

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

nova_controller_discover_hosts:
  cmd.run:
  - name: nova-manage cell_v2 discover_hosts
  {%- if grains.get('noservices') %}
  - onlyif: /bin/false
  {%- endif %}
  - require:
    - cmd: nova_controller_map_cell0
    - cmd: nova_cell1_create

nova_controller_map_instances:
  novang.map_instances:
  - name: 'cell1'
  {%- if grains.get('noservices') %}
  - onlyif: /bin/false
  {%- endif %}
  - require:
    - cmd: nova_controller_discover_hosts
    - pkg: nova_controller_packages

{%- endif %}

{%- if controller.version in ["mitaka", "newton", "ocata"] %}
nova_controller_sync_apidb:
  cmd.run:
  - name: nova-manage api_db sync
  {%- if grains.get('noservices') %}
  - onlyif: /bin/false
  {%- endif %}
  - require:
    - file: /etc/nova/nova.conf

{%- endif %}

nova_controller_syncdb:
  cmd.run:
  - names:
    - nova-manage db sync
  {%- if grains.get('noservices') %}
  - onlyif: /bin/false
  {%- endif %}
  - require:
    - file: /etc/nova/nova.conf

{%- if controller.version in ["mitaka", "newton", "ocata"] %}

nova_controller_online_data_migrations:
  cmd.run:
  - name: nova-manage db online_data_migrations
  {%- if grains.get('noservices') %}
  - onlyif: /bin/false
  {%- endif %}
  - require:
    - cmd: nova_controller_syncdb

{%- endif %}

{%- if controller.version in ["ocata"] %}

nova_apache_restart:
  service.running:
  - enable: true
  - name: apache2
  {%- if grains.get('noservices') %}
  - onlyif: /bin/false
  {%- endif %}
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
  {%- if grains.get('noservices') %}
  - onlyif: /bin/false
  {%- endif %}
  - require:
    - cmd: nova_controller_syncdb
  - watch:
    - file: /etc/nova/nova.conf
    - file: /etc/nova/api-paste.ini

{%- if grains.get('virtual_subtype', None) == "Docker" %}

nova_entrypoint:
  file.managed:
  - name: /entrypoint.sh
  - template: jinja
  - source: salt://nova/files/entrypoint.sh
  - mode: 755

{%- endif %}

{%- endif %}
