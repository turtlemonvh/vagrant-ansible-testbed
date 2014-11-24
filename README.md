# Vagrant + Docker + Ansible Playground

Use Vagrant base machine as launching point to play with ansible.

Ansible provisions base machine

Ansible playbooks are used to launch docker services

## Base box

The vagrantfile was initialized with `vagrant init chef/centos-6.5`

## Running

Start Vagrant

    vagrant up

SSH in

    vagrant ssh

Reprovision

    vagrant reload --provision

Check that playbook is correctly configured (see [the docs](http://docs.ansible.com/playbooks_checkmode.html))

    # You must have ansible installed to run this command
    ansible-playbook provisioning/playbook.yml --check -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory


View the notebooks at http://127.0.0.1:12381/tree
View the supervisord control interface at http://127.0.0.1:12382/


## Installed

- ipython notebook server
- science python packages
- supervisord
    - for managing ipython notebook, and eventually docker instances

## Gotchas

Sometimes the supervisor service needs to be bounced again to get it to start correctly.

    sudo service supervisord restart

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
    - http://wiki.centos.org/Cloud/Docker
    - http://www.liquidweb.com/kb/how-to-install-docker-on-centos-6/
- setup some docker images
    - https://github.com/ianneub/docker-heka
    - https://github.com/dockerfile/elasticsearch, https://registry.hub.docker.com/u/dockerfile/elasticsearch/
    - https://registry.hub.docker.com/_/redis/
    - https://registry.hub.docker.com/_/mysql/
    - https://registry.hub.docker.com/_/mongo/
    - https://registry.hub.docker.com/_/postgres/
- set up helper tasks for creating new docker instances with ansible
- configure dev env
    - node
    - grunt
    - bower
    - requirejs, r.js
    - scss stuff
- packer
    - maybe this would make more sense to keep outside...
