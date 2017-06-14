{%- from "nova/map.jinja" import compute with context %}
{%- if compute.enabled %}

nova_compute_packages:
  pkg.installed:
  - names: {{ compute.pkgs }}

/var/log/nova:
  file.directory:
  {%- if compute.log_dir_perms is defined %}
  - mode: {{ compute.log_dir_perms }}
  {%- else %}
  - mode: 750
  {%- endif %}
  - user: nova
  - group: nova
  - require:
     - pkg: nova_compute_packages
  - require_in:
     - service: nova_compute_services

{%- if compute.vm_swappiness is defined %}
vm.swappiness:
  sysctl.present:
  - value: {{ compute.vm_swappiness }}
  - require:
    - pkg: nova_compute_packages
  - require_in:
    - service: nova_compute_services
{%- endif %}

{%- if compute.user is defined %}

nova_auth_keys:
  ssh_auth.present:
  - user: nova
  - names:
    - {{ compute.user.public_key }}

user_nova_bash:
  user.present:
  - name: nova
  - home: /var/lib/nova
  - shell: /bin/bash
  - groups:
    - libvirtd

/var/lib/nova/.ssh/id_rsa:
  file.managed:
  - user: nova
  - contents_pillar: nova:compute:user:private_key
  - mode: 400
  - require:
    - pkg: nova_compute_packages

/var/lib/nova/.ssh/config:
  file.managed:
  - user: nova
  - contents: StrictHostKeyChecking no
  - mode: 400
  - require:
    - pkg: nova_compute_packages

{%- endif %}

{%- if pillar.nova.controller is not defined %}
/etc/nova/nova.conf:
  file.managed:
  - source: salt://nova/files/{{ compute.version }}/nova-compute.conf.{{ grains.os_family }}
  - template: jinja
  - watch_in:
    - service: nova_compute_services
  - require:
    - pkg: nova_compute_packages
{%- endif %}

nova_compute_services:
  service.running:
  - enable: true
  - names: {{ compute.services }}

{%- set ident = compute.identity %}

{%- if ident.get('api_version', '2') == '3' %}
{%- set version = "v3" %}
{%- else %}
{%- set version = "v2.0" %}
{%- endif %}

{%- if ident.get('protocol', 'http') == 'http' %}
{%- set protocol = 'http' %}
{%- else %}
{%- set protocol = 'https' %}
{%- endif %}

{%- set identity_params = " --os-username="+ident.user+" --os-password="+ident.password+" --os-project-name="+ident.tenant+" --os-auth-url="+protocol+"://"+ident.host+":"+ident.port|string+"/"+version %}

{%- if compute.availability_zone != None %}

Add_compute_to_availability_zone_{{ compute.availability_zone }}:
  cmd.run:
  - name: "nova {{ identity_params }} aggregate-add-host {{ compute.availability_zone }} {{ pillar.linux.system.name }}"
  - unless: "nova {{ identity_params }} service-list | grep {{ compute.availability_zone }} | grep {{ pillar.linux.system.name }}"

{%- endif %}

{%- for aggregate in compute.aggregates %}
Add_compute_to_aggregate_{{ aggregate }}:
  cmd.run:
  - name: "nova {{ identity_params }} aggregate-add-host {{ aggregate }} {{ pillar.linux.system.name }}"
  - unless: "nova {{ identity_params }} aggregate-details {{ aggregate }} | grep {{ pillar.linux.system.name }}"

{%- endfor %}

{%- if compute.virtualization == 'kvm' %}

{%- if not salt['user.info']('nova') %}
# MOS9 libvirt fix to create group
group_libvirtd:
  group.present:
    - name: libvirtd
    - system: True
    - require_in:
      - user: user_nova_compute

user_nova_compute:
  user.present:
  - name: nova
  - home: /var/lib/nova
  {%- if compute.user is defined %}
  - shell: /bin/bash
  {%- else %}
  - shell: /bin/false
  {%- endif %}
  - uid: 303
  - gid: 303
  - system: True
  - groups:
    {%- if salt['group.info']('libvirtd') %}
    - libvirtd
    {%- endif %}
    - nova
  - require_in:
    - pkg: nova_compute_packages
    {%- if compute.user is defined %}
    - file: /var/lib/nova/.ssh/id_rsa
    {%- endif %}

group_nova_compute:
  group.present:
    - name: nova
    - gid: 303
    - system: True
    - require_in:
      - user: user_nova_compute
{%- endif %}

{% if compute.ceph is defined %}

ceph_package:
  pkg.installed:
  - name: ceph-common

/etc/secret.xml:
  file.managed:
  - source: salt://nova/files/secret.xml
  - template: jinja

ceph_virsh_secret_define:
  cmd.run:
  - name: "virsh secret-define --file /etc/secret.xml"
  - unless: "virsh secret-list | grep {{ compute.ceph.secret_uuid }}"
  - require:
    - file: /etc/secret.xml

ceph_virsh_secret_set_value:
  cmd.run:
  - name: "virsh secret-set-value --secret {{ compute.ceph.secret_uuid }} --base64 {{ compute.ceph.client_cinder_key }} "
  - unless: "virsh secret-get-value {{ compute.ceph.secret_uuid }} | grep {{ compute.ceph.client_cinder_key }}"
  - require:
    - cmd: ceph_virsh_secret_define

{% endif %}

{%- if compute.libvirt_bin is defined %}
{{ compute.libvirt_bin }}:
  file.managed:
  - source: salt://nova/files/{{ compute.version }}/libvirt.{{ grains.os_family }}
  - template: jinja
  - require:
    - pkg: nova_compute_packages
  - watch_in:
    - service: {{ compute.libvirt_service }}

{%- if grains.get('init', None) == 'systemd' %}

libvirt_restart_systemd:
  module.wait:
  - name: service.systemctl_reload
  - watch:
    - file: {{ compute.libvirt_bin }}
  - require_in:
    - service: {{ compute.libvirt_service }}

{%- endif %}
{%- endif %}

/etc/libvirt/qemu.conf:
  file.managed:
  - source: salt://nova/files/{{ compute.version }}/qemu.conf.{{ grains.os_family }}
  - template: jinja
  - require:
    - pkg: nova_compute_packages

/etc/libvirt/{{ compute.libvirt_config }}:
  file.managed:
  - source: salt://nova/files/{{ compute.version }}/libvirtd.conf.{{ grains.os_family }}
  - template: jinja
  - require:
    - pkg: nova_compute_packages

virsh net-undefine default:
  cmd.run:
  - name: "virsh net-destroy default"
  - require:
    - pkg: nova_compute_packages
  - onlyif: "virsh net-list | grep default"

{{ compute.libvirt_service }}:
  service.running:
  - enable: true
  {%- if grains.get('noservices') %}
  - onlyif: /bin/false
  {%- endif %}
  - require:
    - pkg: nova_compute_packages
    - cmd: virsh net-undefine default
  - watch:
    - file: /etc/libvirt/{{ compute.libvirt_config }}
    - file: /etc/libvirt/qemu.conf

{%- if grains.get('init', None) == "upstart" %}
# MOS9 libvirt fix for upstart
/etc/init/libvirtd.override:
  file.managed:
  - contents: 'start on runlevel [2345]'
{%- endif %}

{%- endif %}

{# temporary hack to fix broken init script in MOS 9.0 libvirt package #}

{%- if compute.get('manage_init', False) and grains.init == 'upstart' %}

/etc/init/libvirtd.conf:
  file.managed:
  - template: jinja
  - source: salt://nova/files/libvirtd.conf
  - mode: 755

{%- endif %}

{# end temporary hack #}

{%- endif %}
