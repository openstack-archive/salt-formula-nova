
#require 'spec_helper'

nova = {
  user: 'nova',
  group: 'nova',
}
libvirt = {
  user: 'root',
  group: 'root',
}


control 'nova' do
  describe file('/etc/nova') do
    it { should exist }
    it { should be_directory }
  end
  describe file('/var/log/nova') do
    it { should exist }
    it { should be_directory }
  end

  describe file('/etc/nova/nova.conf') do
    it { should exist }
    it { should be_owned_by nova[:user] }
    it { should be_grouped_into nova[:group] }
  end
end


