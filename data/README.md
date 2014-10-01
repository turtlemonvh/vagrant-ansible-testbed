# Data Folder

This will be shared with the vagrant box

## Docker provisioning

Use this as a starting point

https://github.com/ansible/ansible-examples/tree/master/lamp_haproxy
- for web services

http://www.ansible.com/blog/2014/02/12/installing-and-building-docker-with-ansible
- Recommends writing dockerfiles that call ansible playbooks

http://docs.ansible.com/docker_module.html
- docker module for interacting with docker


## Services

- postgresql
- web app
    - flask
    - nginx
    - gunicorn
- redis
- elasticsearch
- haproxy



