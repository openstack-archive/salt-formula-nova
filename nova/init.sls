
include:
{% if pillar.nova.controller is defined %}
- nova.controller
{% endif %}
{% if pillar.nova.compute is defined %}
- nova.compute
{% endif %}
