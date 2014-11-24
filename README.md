# Vagrant + Docker + Ansible Playground

Use Vagrant base machine as launching point to play with ansible.

Ansible provisions base machine

Ansible playbooks are used to launch docker services

## Base box

The vagrantfile was initialized with `vagrant init chef/centos-6.5`

## Using this box

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


## Gotchas

Sometimes the supervisor service needs to be bounced again to get it to start correctly.

    sudo service supervisord restart

## Configured

Shared folders

- ipython notebooks
- test data

## Installed

- ipython notebook server
- science python packages
- supervisord
    - for managing ipython notebook, and eventually docker instances

## Docker

A few come pre-installed.  Right now each has to be started manually.


### Elasticsearch

Links
* https://github.com/dockerfile/elasticsearch
* https://registry.hub.docker.com/u/dockerfile/elasticsearch/

Run with

    sudo docker run -d -p 9200:9200 -p 9300:9300 dockerfile/elasticsearch

### MongoDB

Links
* https://registry.hub.docker.com/_/mongo/

Run with

    sudo docker run --name mongotest -d mongo

### Postgresql

Links
* https://registry.hub.docker.com/_/postgres/

### MySQL

Links
* https://registry.hub.docker.com/_/mysql/


### Redis

Links
* https://registry.hub.docker.com/_/redis/


### TO COME

Services
* Heka: https://github.com/ianneub/docker-heka


I will also add an example notebook for each datastore.


## TODO

- install silver searcher
- use requirements files instead of playbooks for setting up virtualenvs
- set up helper tasks for creating new docker instances with ansible
- configure dev env
    - node
    - grunt
    - bower
    - requirejs, r.js
    - scss stuff
- packer
    - maybe this would make more sense to keep outside...

