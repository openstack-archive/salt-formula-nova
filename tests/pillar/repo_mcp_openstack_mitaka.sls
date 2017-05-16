linux:
  system:
    enabled: true
    repo:
      mirantis_openstack_repo:
        source: "deb http://mirror.fuel-infra.org/mcp-repos/mitaka/{{ grains.get('oscodename') }} mitaka main"
        architectures: amd64
        key_url: "http://mirror.fuel-infra.org/mcp-repos/mitaka/{{ grains.get('oscodename') }}/archive-mcpmitaka.key"
        pin:
        - pin: 'release a=mitaka'
          priority: 1050
          package: '*'
      mirantis_openstack_hotfix:
        source: "deb http://mirror.fuel-infra.org/mcp-repos/mitaka/{{ grains.get('oscodename') }} mitaka-hotfix main"
        architectures: amd64
        key_url: "http://mirror.fuel-infra.org/mcp-repos/mitaka/{{ grains.get('oscodename') }}/archive-mcpmitaka.key"
        pin:
        - pin: 'release a=mitaka-hotfix'
          priority: 1050
          package: '*'
      mirantis_openstack_security:
        source: "deb http://mirror.fuel-infra.org/mcp-repos/mitaka/{{ grains.get('oscodename') }} mitaka-security main"
        architectures: amd64
        key_url: "http://mirror.fuel-infra.org/mcp-repos/mitaka/{{ grains.get('oscodename') }}/archive-mcpmitaka.key"
        pin:
        - pin: 'release a=mitaka-security'
          priority: 1050
          package: '*'
      mirantis_openstack_updates:
        source: "deb http://mirror.fuel-infra.org/mcp-repos/mitaka/{{ grains.get('oscodename') }} mitaka-updates main"
        architectures: amd64
        key_url: "http://mirror.fuel-infra.org/mcp-repos/mitaka/{{ grains.get('oscodename') }}/archive-mcpmitaka.key"
        pin:
        - pin: 'release a=mitaka-uptades'
          priority: 1050
          package: '*'
      mirantis_openstack_holdback:
        source: "deb http://mirror.fuel-infra.org/mcp-repos/mitaka/{{ grains.get('oscodename') }} mitaka-holdback main"
        architectures: amd64
        key_url: "http://mirror.fuel-infra.org/mcp-repos/mitaka/{{ grains.get('oscodename') }}/archive-mcpmitaka.key"
        pin:
        - pin: 'release a=mitaka-holdback'
          priority: 1050
          package: '*'
