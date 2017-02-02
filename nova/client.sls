{%- from "nova/map.jinja" import client with context %}
{%- if client.enabled %}

nova_client_packages:
  pkg.installed:
  - names: {{ client.pkgs }}

{%- for identity_name, identity in client.server.iteritems() %}

{%- for flavor_name, flavor in identity.flavor.iteritems() %}

nova_openstack_flavor_{{ flavor_name }}:
  novang.flavor_present:
    - name: {{ flavor_name }}
    - profile: {{ identity_name }}

    {%- if flavor.flavor_id is defined %}
    - flavor_id: {{ flavor.flavor_id }}
    {%- endif %}
    {%- if flavor.ram is defined %}
    - ram: {{ flavor.ram }}
    {%- endif %}
    {%- if flavor.disk is defined %}
    - disk: {{ flavor.disk }}
    {%- endif %}
    {%- if flavor.vcpus is defined %}
    - vcpus: {{ flavor.vcpus }}
    {%- endif %}

{%- endfor %}

{%- endfor %}

{%- endif %}
