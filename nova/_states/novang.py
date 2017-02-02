# -*- coding: utf-8 -*-
'''
Nova state that ensures that defined flavor is present
'''


def __virtual__():
    '''
    Only load if the nova module is in __salt__
    '''
    return 'novang' if 'nova.flavor_list' in __salt__ else False


def flavor_present(name, flavor_id=0, ram=0, disk=0, vcpus=1, profile=None):
    '''
    Ensures that the nova flavor exists
    
    '''
    print profile
    print name
    ret = {'name': name,
           'changes': {},
           'result': True,
           'comment': 'Flavor "{0}" already exists'.format(name)}
    project = __salt__['nova.flavor_list'](profile)
    print project
    if 'Error' in project:
        pass
    elif name in project:
        pass
    else:
        __salt__['nova.flavor_create'](name, flavor_id, ram, disk, vcpus, profile)
        ret['comment'] = 'Flavor {0} has been created'.format(name)
        ret['changes']['Flavor'] = 'Created'
    return ret


