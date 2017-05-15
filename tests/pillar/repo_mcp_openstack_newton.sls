linux:
  system:
    enabled: true
    repo:
      mirantis_openstack_repo:
        source: "deb http://mirror.fuel-infra.org/mcp-repos/newton/{{ grains.get('oscodename') }} newton main"
        architectures: amd64
        key_url: "http://mirror.fuel-infra.org/mcp-repos/newton/{{ grains.get('oscodename') }}/archive-mcpnewton.key"
        pin:
        - pin: 'release a=newton'
          priority: 1050
          package: '*'
      mirantis_openstack_hotfix:
        source: "deb http://mirror.fuel-infra.org/mcp-repos/newton/{{ grains.get('oscodename') }} newton-hotfix main"
        architectures: amd64
        key_url: "http://mirror.fuel-infra.org/mcp-repos/newton/{{ grains.get('oscodename') }}/archive-mcpnewton.key"
        pin:
        - pin: 'release a=newton-hotfix'
          priority: 1050
          package: '*'
      mirantis_openstack_security:
        source: "deb http://mirror.fuel-infra.org/mcp-repos/newton/{{ grains.get('oscodename') }} newton-security main"
        architectures: amd64
        key_url: "http://mirror.fuel-infra.org/mcp-repos/newton/{{ grains.get('oscodename') }}/archive-mcpnewton.key"
        pin:
        - pin: 'release a=newton-security'
          priority: 1050
          package: '*'
      mirantis_openstack_updates:
        source: "deb http://mirror.fuel-infra.org/mcp-repos/newton/{{ grains.get('oscodename') }} newton-updates main"
        architectures: amd64
        key_url: "http://mirror.fuel-infra.org/mcp-repos/newton/{{ grains.get('oscodename') }}/archive-mcpnewton.key"
        pin:
        - pin: 'release a=newton-uptades'
          priority: 1050
          package: '*'
      mirantis_openstack_holdback:
        source: "deb http://mirror.fuel-infra.org/mcp-repos/newton/{{ grains.get('oscodename') }} newton-holdback main"
        architectures: amd64
        key_url: "http://mirror.fuel-infra.org/mcp-repos/newton/{{ grains.get('oscodename') }}/archive-mcpnewton.key"
        pin:
        - pin: 'release a=newton-holdback'
          priority: 1050
          package: '*'
