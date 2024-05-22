# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"
  config.vm.hostname = "mcserver"
  config.vm.define "mcserver"
  config.vm.network "public_network", ip: "192.168.1.200"

  # Provisions
  config.vm.provision "shell", path: "provision/provision-for-openssh.sh"
  config.vm.provision "shell", path: "provision/provision-for-openjdk.sh"
  config.vm.provision "shell", path: "provision/provision-for-node.sh"
  config.vm.provision "shell", path: "provision/deploy-evolve-api.sh"
  config.vm.provision "shell", path: "provision/deploy-mcserver.sh"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
  
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
  end
end
