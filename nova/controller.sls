{% from "nova/map.jinja" import controller with context %}

{%- if controller.enabled %}

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

nova_controller_syncdb:
  cmd.run:
  - names:
    - nova-manage db sync
    {%- if controller.version == "mitaka" %}
    - nova-manage api_db sync
    {%- endif %}
  - require:
    - file: /etc/nova/nova.conf

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
