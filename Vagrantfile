# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/centos-6.5"

  config.vm.network "forwarded_port", guest: 80, host: 12380
  config.vm.network "forwarded_port", guest: 8888, host: 12381
  config.vm.network "forwarded_port", guest: 9001, host: 12382

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  # IPython notebook shared directory
  # If updating this, also update host_vars/local
  $SYNCED_FOLDERS = {
    "data" => "/vagrant_data",
    "notebooks" => "/vagrant_notebooks"
  }

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  $SYNCED_FOLDERS.each do |src, dst|
    config.vm.synced_folder src, dst
  end

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision "shell", path: "provisioning/bootstrap.sh"

end
