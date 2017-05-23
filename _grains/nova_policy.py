#!/usr/bin/env python
import salt.config
import salt.loader


def main():
    path = "/etc/nova/policy.json"
    __opts__ = salt.config.minion_config('/etc/salt/minion')
    keystone_policy_mod = salt.loader.raw_mod(__opts__, 'keystone_policy', None)
    if keystone_policy_mod:
        result = keystone_policy_mod['keystone_policy.rule_list'](path)
        if result and 'Error' not in result:
            return {'nova_policy': result}
    return {}

