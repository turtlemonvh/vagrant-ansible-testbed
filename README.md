# Vagrant + Docker + Ansible Playground

Use Vagrant base machine as launching point to play with ansible.

Ansible provisions base machine

Ansible playbooks are used to launch docker services

## Base box

The vagrantfile was initialized with `vagrant init chef/centos-6.5`

## How to use

Activate virtualenv

    $(cat workonansible)

Start Vagrant

    vagrant up

SSH in

    vagrant ssh

Reprovision

    vagrant reload --provision

Check that playbook is correctly configured (see [the docs](http://docs.ansible.com/playbooks_checkmode.html))

    ansible-playbook provisioning/playbook.yml --check -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory


## Installed

- ipython notebook server
- science python packages
- supervisord
    - for managing ipython notebook, and eventually docker instances

## Configured

Shared folders

- ipython notebooks
- test data

## TODO

- install silver searcher
- break up into smaller playbooks
- write python installation as a separate task
- use requirements files instead of playbooks for setting up virtualenvs
- install docker
- set up helper tasks for creating new docker instances with ansible
- configure dev env
    - node
    - grunt
    - bower
    - requirejs, r.js
    - scss stuff
- packer
    - maybe this would make more sense to keep outside...
