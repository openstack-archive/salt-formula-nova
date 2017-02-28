# -*- coding: utf-8 -*-
'''
Nova state that ensures that defined flavor is present
'''
import logging
import collections
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


def availability_zone_present(name=None, availability_zone=None, profile=None):
    '''
    Ensures that the nova availability zone exists
    '''
    name = availability_zone
    zone_exists = __salt__['novang.availability_zone_get'](name, profile)
    if zone_exists == False:
        item_created = __salt__['novang.availability_zone_create'](name, availability_zone, profile)
        if bool(item_created):
            return _created(availability_zone, 'availabilty zone', item_created)         
    else:
        return _already_exists(availability_zone, 'availabilty zone')
    return existing_availability_zones


def instance_present(name, flavor, image, networks, security_groups=None, profile=None, tenant_name=None):
    ret = {'name': name,
           'changes': {},
           'result': True,
           'comment': 'Instance "{0}" already exists'.format(name)}
    kwargs = {}
    nics = []
    existing_instances = __salt__['novang.server_list'](profile, tenant_name)
    if name in existing_instances:
        return ret
    existing_flavors = __salt__['nova.flavor_list'](profile)
    if flavor in existing_flavors:
        flavor_id = existing_flavors[flavor]['id']
    else:
        return {'name': name,
                'changes': {},
                'result': False,
                'comment': 'Flavor "{0}" doesn\'t exists'.format(flavor)}

    existing_image = __salt__['nova.image_list'](image, profile)
    if not existing_image:
        return {'name': name,
                'changes': {},
                'result': False,
                'comment': 'Image "{0}" doesn\'t exists'.format(image)}
    else:
        image_id = existing_image.get(image).get('id')
    if security_groups is not None:
        kwargs['security_groups'] = []
        for secgroup in security_groups:
            existing_secgroups = __salt__['novang.secgroup_list'](profile, tenant_name)
            if not secgroup in existing_secgroups:
                return {'name': name,
                        'changes': {},
                        'result': False,
                        'comment': 'Security group "{0}" doesn\'t exists'.format(secgroup)}
            else:
                kwargs['security_groups'].append(secgroup)
    for net in networks:
        existing_network = __salt__['novang.network_show'](net.get('name'), profile)
        if not existing_network:
            return {'name': name,
                    'changes': {},
                    'result': False,
                    'comment': 'Network "{0}" doesn\'t exists'.format(net.get(name))}
        else:
            network_id = existing_network.get('id')
            if net.get('v4_fixed_ip') is not None:
                nics.append({'net-id': network_id, 'v4-fixed-ip': net.get('v4_fixed_ip')})
            else:
                nics.append({'net-id': network_id})
    kwargs['nics'] = nics
    new_instance_id = __salt__['novang.boot'] (name, flavor_id, image_id, profile, tenant_name, **kwargs)
    return {'name': name,
            'changes': {},
            'result': True,
            'comment': 'Instance "{0}" was successfuly created'.format(name)}

def _already_exists(name, resource):
    changes_dict = {'name': name,
                    'changes': {},
                    'result': True}
    changes_dict['comment'] = \
        '{0} {1} already exists'.format(resource, name)
    return changes_dict


def _created(name, resource, resource_definition):
    changes_dict = {'name': name,
                    'changes': resource_definition,
                    'result': True,
                    'comment': '{0} {1} created'.format(resource, name)}
    return changes_dict

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