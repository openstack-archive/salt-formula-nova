# -*- coding: utf-8 -*-
from __future__ import absolute_import
from pprint import pprint

# Import python libs
import logging

# Import salt libs
import salt.utils.openstack.nova as suon

# Get logging started
log = logging.getLogger(__name__)

# Function alias to not shadow built-ins
__func_alias__ = {
    'list_': 'list'
}

# Define the module's virtual name
__virtualname__ = 'novang'


def __virtual__():
    '''
    Only load this module if nova
    is installed on this minion.
    '''
    if suon.check_nova():
        return __virtualname__
    return (False, 'The nova execution module failed to load: '
            'only available if nova is installed.')


__opts__ = {}


def _auth(profile=None, tenant_name=None):
    '''
    Set up nova credentials
    '''
    if profile:
        credentials = __salt__['config.option'](profile)
        user = credentials['keystone.user']
        password = credentials['keystone.password']
        if tenant_name:
            tenant = tenant_name
        else:
            tenant = credentials['keystone.tenant']
        auth_url = credentials['keystone.auth_url']
        region_name = credentials.get('keystone.region_name', None)
        api_key = credentials.get('keystone.api_key', None)
        os_auth_system = credentials.get('keystone.os_auth_system', None)
    else:
        user = __salt__['config.option']('keystone.user')
        password = __salt__['config.option']('keystone.password')
        tenant = __salt__['config.option']('keystone.tenant')
        auth_url = __salt__['config.option']('keystone.auth_url')
        region_name = __salt__['config.option']('keystone.region_name')
        api_key = __salt__['config.option']('keystone.api_key')
        os_auth_system = __salt__['config.option']('keystone.os_auth_system')
    kwargs = {
        'username': user,
        'password': password,
        'api_key': api_key,
        'project_id': tenant,
        'auth_url': auth_url,
        'region_name': region_name,
        'os_auth_plugin': os_auth_system
    }

    return suon.SaltNova(**kwargs)


def get_connection_args(profile=None):
    '''
    Set up profile credentials
    '''
    if profile:
        credentials = __salt__['config.option'](profile)
        user = credentials['keystone.user']
        password = credentials['keystone.password']
        tenant = credentials['keystone.tenant']
        auth_url = credentials['keystone.auth_url']

    kwargs = {
        'username': user,
        'password': password,
        'tenant': tenant,
        'auth_url': auth_url
    }
    return kwargs


def quota_list(tenant_name, profile=None):
    '''
    list quotas of a tenant
    '''
    connection_args = get_connection_args(profile)
    tenant = __salt__['keystone.tenant_get'](name=tenant_name, profile=profile, **connection_args)
    tenant_id = tenant[tenant_name]['id']
    conn = _auth(profile)
    nt_ks = conn.compute_conn
    item = nt_ks.quotas.get(tenant_id).__dict__
    return item


def quota_get(name, tenant_name, profile=None, quota_value=None):
    '''
    get specific quota value of a tenant
    '''
    item = quota_list(tenant_name, profile)
    quota_value = item[name]
    return quota_value


def quota_update(tenant_name, profile=None, **quota_argument):
    '''
    update quota of specified tenant
    '''
    connection_args = get_connection_args(profile)
    tenant = __salt__['keystone.tenant_get'](name=tenant_name, profile=profile, **connection_args)
    tenant_id = tenant[tenant_name]['id']
    conn = _auth(profile)
    nt_ks = conn.compute_conn
    item = nt_ks.quotas.update(tenant_id, **quota_argument)
    return item
def server_list(profile=None, tenant_name=None):
    '''
    Return list of active servers
    CLI Example:
    .. code-block:: bash
        salt '*' nova.server_list
    '''
    conn = _auth(profile, tenant_name)
    return conn.server_list()

def secgroup_list(profile=None, tenant_name=None):
    '''
    Return a list of available security groups (nova items-list)
    CLI Example:
    .. code-block:: bash
        salt '*' nova.secgroup_list
    '''
    conn = _auth(profile, tenant_name)
    return conn.secgroup_list()

def boot(name, flavor_id=0, image_id=0, profile=None, tenant_name=None, timeout=300, **kwargs):
    '''
    Boot (create) a new instance
    name
        Name of the new instance (must be first)
    flavor_id
        Unique integer ID for the flavor
    image_id
        Unique integer ID for the image
    timeout
        How long to wait, after creating the instance, for the provider to
        return information about it (default 300 seconds).
        .. versionadded:: 2014.1.0
    CLI Example:
    .. code-block:: bash
        salt '*' nova.boot myinstance flavor_id=4596 image_id=2
    The flavor_id and image_id are obtained from nova.flavor_list and
    nova.image_list
    .. code-block:: bash
        salt '*' nova.flavor_list
        salt '*' nova.image_list
    '''
    #kwargs = {'nics': nics}
    conn = _auth(profile, tenant_name)
    return conn.boot(name, flavor_id, image_id, timeout, **kwargs)
def network_show(name, profile=None):
    conn = _auth(profile)
    return conn.network_show(name)
