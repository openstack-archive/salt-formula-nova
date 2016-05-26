{%- from "nova/map.jinja" import controller with context -%}
#!/bin/bash -e

cat /srv/salt/pillar/nova-controller.sls | envsubst > /tmp/nova-controller.sls
mv /tmp/nova-controller.sls /srv/salt/pillar/nova-controller.sls

salt-call --local --retcode-passthrough state.highstate

{% for service in controller.services %}
service {{ service }} stop || true
{% endfor %}

if [ "$1" == "api" ]; then
    echo "starting nova-api"
    su nova --shell=/bin/sh -c '/usr/bin/nova-api --config-file=/etc/nova/nova.conf'
elif [ "$1" == "scheduler" ]; then
    echo "starting nova-scheduler"
    su nova --shell=/bin/sh -c '/usr/bin/nova-scheduler --config-file=/etc/nova/nova.conf'
elif [ "$1" == "conductor" ]; then
    echo "starting nova-conductor"
    su nova --shell=/bin/sh -c '/usr/bin/nova-conductor --config-file=/etc/nova/nova.conf'
elif [ "$1" == "consoleauth" ]; then
    echo "starting nova-consoleauth"
    su nova --shell=/bin/sh -c '/usr/bin/nova-consoleauth --config-file=/etc/nova/nova.conf'
elif [ "$1" == "cert" ]; then
    echo "starting nova-cert"
    su nova --shell=/bin/sh -c '/usr/bin/nova-cert --config-file=/etc/nova/nova.conf'
elif [ "$1" == "novncproxy" ]; then
    echo "starting nova-novncproxy"
    su nova --shell=/bin/sh -c '/usr/bin/nova-novncproxy --config-file=/etc/nova/nova.conf'
else
    echo "No parameter submitted, don't know what to start" 1>&2
fi

{#-
vim: syntax=jinja
-#}