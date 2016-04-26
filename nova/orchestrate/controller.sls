{%- if grains['saltversion'] >= "2016.3.0" %}

{# Batch execution is necessary - usable after 2016.3.0 release #}
nova.controller:
  salt.state:
    - tgt: 'nova:controller'
    - tgt_type: pillar
    - batch: 1
    - sls: nova.controller
    - require:
      - salt: keystone.server

{%- else %}

{# Workaround for cluster with up to 3 members #}
nova.controller:
  salt.state:
    - tgt: '*01* and I@nova:controller'
    - tgt_type: compound
    - sls: nova.controller
    - require:
      - salt: keystone.server

nova.controller.02:
  salt.state:
    - tgt: '*02* and I@nova:controller'
    - tgt_type: compound
    - sls: nova.controller
    - require:
      - salt: keystone.server

nova.controller.03:
  salt.state:
    - tgt: '*03* and I@nova:controller'
    - tgt_type: compound
    - sls: nova.controller
    - require:
      - salt: keystone.server

{%- endif %}

