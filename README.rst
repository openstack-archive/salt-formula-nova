
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


Development and testing
=======================

Development and test workflow with `Test Kitchen <http://kitchen.ci>`_ and
`kitchen-salt <https://github.com/simonmcc/kitchen-salt>`_ provisioner plugin.

Test Kitchen is a test harness tool to execute your configured code on one or more platforms in isolation.
There is a ``.kitchen.yml`` in main directory that defines *platforms* to be tested and *suites* to execute on them.

Kitchen CI can spin instances locally or remote, based on used *driver*.
For local development ``.kitchen.yml`` defines a `vagrant <https://github.com/test-kitchen/kitchen-vagrant>`_ or
`docker  <https://github.com/test-kitchen/kitchen-docker>`_ driver.

To use backend drivers or implement your CI follow the section `INTEGRATION.rst#Continuous Integration`__.

A listing of scenarios to be executed:

.. code-block:: shell

  $ kitchen list

  Instance                    Driver   Provisioner  Verifier  Transport  Last Action

  default-ubuntu-1604          Docker  Shell        Inspec    Ssh        Verified
  control-single-ubuntu-1404   Docker  SaltSolo     Inspec    Ssh        Verified
  control-single-ubuntu-1604   Docker  SaltSolo     Inspec    Ssh        Verified
  control-cluster-ubuntu-1404  Docker  SaltSolo     Inspec    Ssh        Verified
  control-cluster-ubuntu-1604  Docker  SaltSolo     Inspec    Ssh        Verified
  compute-single-ubuntu-1404   Docker  SaltSolo     Inspec    Ssh        Verified
  compute-single-ubuntu-1604   Docker  SaltSolo     Inspec    Ssh        Verified
  compute-cluster-ubuntu-1404  Docker  SaltSolo     Inspec    Ssh        Verified
  compute-cluster-ubuntu-1604  Docker  SaltSolo     Inspec    Ssh        Verified


The `Busser <https://github.com/test-kitchen/busser>`_ *Verifier* is used to setup and run tests
implementated in `<repo>/test/integration`. It installs the particular driver to tested instance
(`Serverspec <https://github.com/neillturner/kitchen-verifier-serverspec>`_,
`InSpec <https://github.com/chef/kitchen-inspec>`_, Shell, Bats, ...) prior the verification is executed.


Usage:

.. code-block:: shell

 # list instances and status
 kitchen list

 # manually execute integration tests
 kitchen [test || [create|converge|verify|exec|login|destroy|...]] [instance] -t tests/integration

 # use with provided Makefile (ie: within CI pipeline)
 make kitchen



Continuous Integration
----------------------

We uses a Jenkins to spin a kitchen instances in Docker or OpenStack environment.

If you would like to repeat, than you may use ``.kitchen.<backend>.yml`` configuration yaml in the main folder
to override ``.kitchen.yml`` at some points.
Usage: ``KITCHEN_LOCAL_YAML=.kitchen.<backend>.tml kitchen verify control-single-ubuntu-1404 -t tests/integration``.

CI performs following (Kitchen Test) actions on each instance:

1. *create*, provision an test instance and wait until executed salt bootstrap script finish (pkg install, etc.).
2. *converge*, run a provisioner (shell script or kitchen-salt)
3. *verify*, run a verification (inspec, other may be added)
4. *destroy*


Verfication
-----------

Default verification is implemented in InSpec DSL.
Intent here is to create/reuse foundation of inspec profiles for the OpenStack component.

If you would to write another verification scripts than InSpec store them in ``<repo>/tests/integration/<suite>/<busser>/*``.
``Busser <https://github.com/test-kitchen/busser>`` is a test setup and execution framework under test kitchen.


Test Kitchen
------------


To install Test Kitchen is as simple as:

.. code-block:: shell

  gem install test-kitchen

  # install additional kitchen plugins if needed
  gem install kitchen-docker kitchen-openstack kitchen-inspec busser-serverspec

  kitchen list
  kitchen test

of course you have to have installed Ruby and it's package manager `gem <https://rubygems.org/>`_ first.

One may be satisfied installing it system-wide right from OS package manager,
however for the sake of complex environments you may use `rbenv <https://github.com/rbenv/rbenv>`_ for user side ruby installation.

 * https://github.com/rbenv/rbenv
 * http://kitchen.ci/docs/getting-started/installing

An example steps than might be:

.. code-block:: shell

  # get rbenv
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv

  # configure
  cd ~/.rbenv && src/configure && make -C src     # don't worry if it fails
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"'     >> ~/.bash_profile
  cd ~/.rbenv; git fetch

  # list all available versions:
  rbenv install -l

  #install a Ruby version:
  rbenv install 2.0.0-p247

  # activate
  rbenv local 2.0.0-p247

  # install test kitchen
  gem install test-kitchen

An optional ``Gemfile`` in the main folder may contain Ruby dependencies to be required for Test Kitchen workflow.
To install them you have to install first ``gem install bundler`` and then run ``bundler install``.


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
