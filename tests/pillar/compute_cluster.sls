nova:
  compute:
    version: liberty
    enabled: true
    virtualization: kvm
    heal_instance_info_cache_interval: 60
    vncproxy_url: openstack:6080
    report_interval: 60
    vnc_keymap: en-gb
    bind:
      vnc_address: 127.0.0.1
      vnc_port: 6080
      vnc_name: 0.0.0.0
    database:
      engine: mysql
      host: 127.0.0.1
      port: 3306
      name: nova
      user: nova
      password: password
    identity:
      engine: keystone
      region: RegionOne
      host: 127.0.0.1
      port: 35357
      user: nova
      password: password
      tenant: service
    message_queue:
      engine: rabbitmq
      members:
      - host: 127.0.0.1
      - host: 127.0.1.1
      - host: 127.0.2.1
      user: openstack
      password: password
      virtual_host: '/openstack'
    image:
      engine: glance
      host: 127.0.0.1
      port: 9292
    network:
      engine: neutron
      region: RegionOne
      host: 127.0.0.1
      port: 9696
      extension_sync_interval: 600
    cache:
      engine: memcached
      members:
      - host: 127.0.0.1
        port: 11211
      - host: 127.0.1.1
        port: 11211
      - host: 127.0.2.1
        port: 11211
