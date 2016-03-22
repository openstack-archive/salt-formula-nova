
==============
Nova
==============

OpenStack Nova provides a cloud computing fabric controller, supporting a wide variety of virtualization technologies, including KVM, Xen, LXC, VMware, and more. In addition to its native API, it includes compatibility with the commonly encountered Amazon EC2 and S3 APIs.

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

Read more
=========

* http://docs.openstack.org/developer/nova/
* http://lists.openstack.org/cgi-bin/mailman/listinfo/openstack-dev
* http://bugs.launchpad.net/nova
