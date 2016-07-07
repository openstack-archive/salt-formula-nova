
# TODO, enable helper files once resolved - https://github.com/chef/kitchen-inspec/issues/93
#require 'nova_spec'
#require 'spec_helper'

# TODO, remove linked nova_spec.rb from suites test folders once helper files loaded
nova = {
  user: 'nova',
  group: 'nova',
}

control 'nova compute' do
  describe file('/etc/nova/nova-compute.conf') do
    it { should exist }
    it { should be_owned_by nova[:user] }
    it { should be_grouped_into nova[:group] }

    its('content') { should match('^compute_driver=libvirt.LibvirtDriver') }
    its('content') { should match('^virt_type=kvm') }
  end
end


