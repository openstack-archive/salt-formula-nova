
only_if do
  command('virsh').exist?
end

libvirt = {
  user: 'root',
  group: 'root',
}

control 'libvirt' do
  describe file('/etc/libvirt') do
    it { should exist }
    it { should be_directory }
  end
  describe file('/var/log/libvirt') do
    it { should exist }
    it { should be_directory }
  end
  describe file('/var/lib/libvirt') do
    it { should exist }
    it { should be_directory }
  end

  %w(libvirtd.conf qemu.conf).each do |conf|
    describe file(::File.join('/etc/libvirt',conf)) do
      it { should exist }
      it { should be_owned_by libvirt[:user] }
      it { should be_grouped_into libvirt[:group] }
    end
  end
end
