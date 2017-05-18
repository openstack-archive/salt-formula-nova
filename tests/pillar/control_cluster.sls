nova:
  controller:
    enabled: true
    networking: default
    version: liberty
    vncproxy_url: 127.0.0.1
    vnc_keymap: en-gb
    security_group: false
    dhcp_domain: novalocal
    scheduler_default_filters: "DifferentHostFilter,RetryFilter,AvailabilityZoneFilter,RamFilter,CoreFilter,DiskFilter,ComputeFilter,ComputeCapabilitiesFilter,ImagePropertiesFilter,ServerGroupAntiAffinityFilter,ServerGroupAffinityFilter"
    cpu_allocation_ratio: 16.0
    ram_allocation_ratio: 1.5
    disk_allocation_ratio: 1.0
    workers: 8
    bind:
      private_address: 127.0.0.1
      public_address: 127.0.0.1
      public_name: 127.0.0.1
      novncproxy_port: 6080
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
    glance:
      host: 
      port: 9292
    network:
      engine: neutron
      region: RegionOne
      host: 127.0.0.1
      port: 9696
      mtu: 1500
      user: nova
      password: password
      tenant: service
    metadata:
      password: metadata
    audit:
      filter_factory: 'keystonemiddleware.audit:filter_factory'
      map_file: '/etc/pycadf/nova_api_audit_map.conf'
    policy:
      context_is_admin: 'role:admin or role:administrator'
      'compute:create': 'rule:admin_or_owner'
      'compute:create:attach_network':

