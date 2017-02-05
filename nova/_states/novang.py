# -*- coding: utf-8 -*-
'''
Nova state that ensures that defined flavor is present
'''
import logging
from functools import wraps
LOG = logging.getLogger(__name__)


def __virtual__():
    '''
    Only load if the nova module is in __salt__
    '''
    return 'novang' if 'nova.flavor_list' in __salt__ else False   


def flavor_present(name, flavor_id=0, ram=0, disk=0, vcpus=1, profile=None):
    '''
    Ensures that the nova flavor exists  
    '''
    ret = {'name': name,
           'changes': {},
           'result': True,
           'comment': 'Flavor "{0}" already exists'.format(name)}
    project = __salt__['nova.flavor_list'](profile)
    if 'Error' in project:
        pass
    elif name in project:
        pass
    else:
        __salt__['nova.flavor_create'](name, flavor_id, ram, disk, vcpus, profile)
        ret['comment'] = 'Flavor {0} has been created'.format(name)
        ret['changes']['Flavor'] = 'Created'
    return ret


def quota_present(tenant_name, profile, name=None, **kwargs):
    '''
    Ensures that the nova quota exists
    '''
    changes = {}
    for key, value in kwargs.items():
        quota = __salt__['novang.quota_get'](key, tenant_name, profile)
        if quota != value:
            arg = {}
            arg[key] = value
            changes[key] = value
            __salt__['novang.quota_update'](tenant_name, profile, **arg)
    if bool(changes):
        return _updated(tenant_name, 'tenant', changes)        
    else:
        return _no_change(tenant_name, 'tenant')

def _updated(name, resource, resource_definition):
    changes_dict = {'name': name,
                    'changes': resource_definition,
                    'result': True,
                    'comment': '{0} {1} tenant was updated'.format(resource, name)}
    return changes_dict

def _update_failed(name, resource):
    changes_dict = {'name': name,
                    'changes': {},
                    'comment': '{0} {1} failed to update'.format(resource, name),
                    'result': False}
    return changes_dict

def _no_change(name, resource, test=False):
    changes_dict = {'name': name,
                    'changes': {},
                    'result': True}
    if test:
        changes_dict['comment'] = \
            '{0} {1} will be {2}'.format(resource, name, test)
    else:
        changes_dict['comment'] = \
            '{0} {1} is in correct state'.format(resource, name)
    return changes_dict
