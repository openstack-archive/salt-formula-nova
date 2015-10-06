{% from "nova/map.jinja" import compute with context %}

{%- if compute.enabled %}

nova_compute_packages:
  pkg.installed:
  - names: {{ compute.pkgs }}

{%- if not salt['user.info']('nova') %}
user_nova:
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

group_nova:
  group.present:
    - name: nova
    - gid: 303
    - system: True
    - require_in:
      - user: user_nova
{%- endif %}

{%- if compute.user is defined %}

nova_auth_keys:
  ssh_auth.present:
  - user: nova
  - names:
    - {{ compute.user.public_key }}

/var/lib/nova/.ssh/id_rsa:
  file.managed:
  - user: nova
  - contents_pillar: nova:compute:user:private_key
  - mode: 400
  - require:
    - pkg: nova_compute_packages

{%- endif %}

{%- if pillar.nova.controller is not defined %}

{%- if compute.get('networking', 'default') == "contrail" %}


/etc/nova/nova.conf:
  file.managed:
  - source: salt://nova/files/{{ compute.version }}/nova-compute.conf.contrail.{{ grains.os_family }}
  - template: jinja
  - require:
    - pkg: nova_compute_packages

{%- else %}

/etc/nova/nova.conf:
  file.managed:
  - source: salt://nova/files/{{ compute.version }}/nova-compute.conf.{{ grains.os_family }}
  - template: jinja
  - require:
    - pkg: nova_compute_packages

{%- endif %}

nova_compute_services:
  service.running:
  - enable: true
  - names: {{ compute.services }}
  - watch:
    - file: /etc/nova/nova.conf

{%- if compute.virtualization == 'kvm' %}

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

/etc/default/libvirt-bin:
  file.managed:
  - source: salt://nova/files/{{ compute.version }}/libvirt-bin
  - template: jinja
  - require:
    - pkg: nova_compute_packages

/etc/libvirt/qemu.conf:
  file.managed:
  - source: salt://nova/files/{{ compute.version }}/qemu.conf.{{ grains.os_family }}
  - template: jinja
  - require:
    - pkg: nova_compute_packages

/etc/libvirt/libvirtd.conf:
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

libvirt-bin:
  service.running:
  - enable: true
  - require:
    - pkg: nova_compute_packages
    - cmd: virsh net-undefine default
  - watch:
    - file: /etc/libvirt/libvirtd.conf
    - file: /etc/default/libvirt-bin

{%- endif %}

{%- endif %}

{%- endif %}
