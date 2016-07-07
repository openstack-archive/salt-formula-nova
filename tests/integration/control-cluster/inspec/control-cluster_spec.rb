
# TODO, enable helper files once resolved - https://github.com/chef/kitchen-inspec/issues/93
#require 'nova_spec'
#require 'spec_helper'
#require '../compute-single/compute'

nova = {
  user: 'nova',
  group: 'nova',
}

control 'nova control' do
  describe file('/etc/nova/nova.conf') do
    it { should exist }
    it { should be_owned_by nova[:user] }
    it { should be_grouped_into nova[:group] }

    #its('content') { should match('^compute_driver=libvirt.LibvirtDriver') }
    #its('content') { should match('^virt_type=kvm') }
  end
end
