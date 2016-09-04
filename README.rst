
==============
Nova
==============

OpenStack Nova provides a cloud computing fabric controller, supporting a wide
variety of virtualization technologies, including KVM, Xen, LXC, VMware, and
more. In addition to its native API, it includes compatibility with the
commonly encountered Amazon EC2 and S3 APIs.

Sample pillars
==============

Controller nodes
----------------

Nova services on the controller node

.. code-block:: yaml

    nova:
      controller:
        version: juno
        enabled: true
        security_group: true
        cpu_allocation_ratio: 8.0
        ram_allocation_ratio: 1.0
        disk_allocation_ratio: 1.0
        workers: 8
        report_interval: 60
        bind:
          public_address: 10.0.0.122
          public_name: openstack.domain.com
          novncproxy_port: 6080
        database:
          engine: mysql
          host: 127.0.0.1
          port: 3306
          name: nova
          user: nova
          password: pwd
        identity:
          engine: keystone
          host: 127.0.0.1
          port: 35357
          user: nova
          password: pwd
          tenant: service
        message_queue:
          engine: rabbitmq
          host: 127.0.0.1
          port: 5672
          user: openstack
          password: pwd
          virtual_host: '/openstack'
        network:
          engine: neutron
          host: 127.0.0.1
          port: 9696
          extension_sync_interval: 600
          identity:
            engine: keystone
            host: 127.0.0.1
            port: 35357
            user: neutron
            password: pwd
            tenant: service
        metadata:
          password: password


Nova services from custom package repository

.. code-block:: yaml

    nova:
      controller:
        version: juno
        source:
          engine: pkg
          address: http://...
      ....


Client-side RabbitMQ HA setup

.. code-block:: yaml

   nova:
     controller:
       ....
       message_queue:
         engine: rabbitmq
         members:
           - host: 10.0.16.1
           - host: 10.0.16.2
           - host: 10.0.16.3
         user: openstack
         password: pwd
         virtual_host: '/openstack'
      ....


Compute nodes
-------------

Nova controller services on compute node

.. code-block:: yaml

    nova:
      compute:
        version: juno
        enabled: true
        virtualization: kvm
        security_group: true
        bind:
          vnc_address: 172.20.0.100
          vnc_port: 6080
          vnc_name: openstack.domain.com
          vnc_protocol: http
        database:
          engine: mysql
          host: 127.0.0.1
          port: 3306
          name: nova
          user: nova
          password: pwd
        identity:
          engine: keystone
          host: 127.0.0.1
          port: 35357
          user: nova
          password: pwd
          tenant: service
        message_queue:
          engine: rabbitmq
          host: 127.0.0.1
          port: 5672
          user: openstack
          password: pwd
          virtual_host: '/openstack'
        image:
          engine: glance
          host: 127.0.0.1
          port: 9292
        network:
          engine: neutron
          host: 127.0.0.1
          port: 9696
          identity:
            engine: keystone
            host: 127.0.0.1
            port: 35357
            user: neutron
            password: pwd
            tenant: service
        qemu:
          max_files: 4096
          max_processes: 4096

Nova services on compute node with OpenContrail

.. code-block:: yaml

    nova:
      compute:
        enabled: true
        ...
        networking: contrail


Nova services on compute node with memcached caching

.. code-block:: yaml

    nova:
      compute:
        enabled: true
        ...
        cache:
          engine: memcached
          members:
          - host: 127.0.0.1
            port: 11211
          - host: 127.0.0.1
            port: 11211


Client-side RabbitMQ HA setup

.. code-block:: yaml

   nova:
     controller:
       ....
       message_queue:
         engine: rabbitmq
         members:
           - host: 10.0.16.1
           - host: 10.0.16.2
           - host: 10.0.16.3
         user: openstack
         password: pwd
         virtual_host: '/openstack'
      ....


Nova with ephemeral configured with Ceph

.. code-block:: yaml

    nova:
      compute:
        enabled: true
        ...
        ceph:
          ephemeral: yes
          rbd_pool: nova
          rbd_user: nova
          secret_uuid: 03006edd-d957-40a3-ac4c-26cd254b3731


Documentation and Bugs
============================

To learn how to deploy OpenStack Salt, consult the documentation available
online at:

    https://wiki.openstack.org/wiki/OpenStackSalt

In the unfortunate event that bugs are discovered, they should be reported to
the appropriate bug tracker. If you obtained the software from a 3rd party
operating system vendor, it is often wise to use their own bug tracker for
reporting problems. In all other cases use the master OpenStack bug tracker,
available at:

    http://bugs.launchpad.net/openstack-salt

Developers wishing to work on the OpenStack Salt project should always base
their work on the latest formulas code, available from the master GIT
repository at:

    https://git.openstack.org/cgit/openstack/salt-formula-nova

Developers should also join the discussion on the IRC list, at:

    https://wiki.openstack.org/wiki/Meetings/openstack-salt
