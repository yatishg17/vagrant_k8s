Vagrant.configure("2") do |config|
  config.vm.provision "shell", :path => "script.sh"

  config.vm.define "node1" do |node1|
    node1.vm.box = "generic/ubuntu2010"
    node1.vm.hostname = "master1"
    node1.vm.provider "libvirt" do |libvirt|
        libvirt.memory = 2048
        libvirt.cpus = 2
    end
  end

  config.vm.define "node2" do |node2|
    node2.vm.box = "generic/ubuntu2010"
    node2.vm.hostname = "worker1"
    node2.vm.provider "libvirt" do |libvirt|
        libvirt.memory = 2500
        libvirt.cpus = 2
    end
  end

  #config.vm.define "node3" do |node3|
  #  node3.vm.box = "generic/ubuntu2010"
  #  node3.vm.hostname = "worker2"
  #  node3.vm.provider "libvirt" do |libvirt|
  #      libvirt.memory = 1048
  #      libvirt.cpus = 2
  #  end
  #end

end
