nova:
  compute:
    version: liberty
    enabled: true
    vcpu_pin_set: 1,2,3
    hugepages:
      mount_points:
      - path: /mnt/hugepages_1GB
    virtualization: kvm
    disk_cachemodes: network=writeback,block=none
    heal_instance_info_cache_interval: 60
    vncproxy_url: openstack:6080
    report_interval: 60
    vnc_keymap: en-gb
    resume_guests_state_on_host_boot: True
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
      user: nova
      password: password
      tenant: service
    metadata:
      password: metadata
    cache:
      engine: memcached
      members:
      - host: 127.0.0.1
        port: 11211
      - host: 127.0.1.1
        port: 11211
      - host: 127.0.2.1
        port: 11211
    libvirt:
      hw_disk_discard: unmap
      live_migration_tunnelled: False
    upgrade_levels:
      compute: liberty
    libvirt_service_group: libvirtd
    lvm:
      ephemeral: yes
      images_volume_group: nova_vg
      volume_clear: zero
      volume_clear_size: 0
    barbican:
      enabled: true
