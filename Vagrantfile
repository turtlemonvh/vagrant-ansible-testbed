# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  # Additional: 
  config.vm.box = "chef/centos-6.5"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 12380
  config.vm.network "forwarded_port", guest: 8888, host: 12381
  config.vm.network "forwarded_port", guest: 9001, host: 12382

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  # IPython notebook shared directory
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

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # Ansible provisioning
  # https://docs.vagrantup.com/v2/provisioning/ansible.html
  # http://docs.ansible.com/guide_vagrant.html
  #   
  # Setup docker, ansible, ipython notebook w/ anaconda

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.verbose = "v"
    ansible.sudo = true
    ansible.extra_vars = {
      "ansible_ssh_user" => "vagrant",
      "dst_username" => "vagrant",
      "shared_folders" => $SYNCED_FOLDERS
    }

  end


end
