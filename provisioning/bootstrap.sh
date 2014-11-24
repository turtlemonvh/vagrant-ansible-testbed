# http://docs.ansible.com/intro_installation.html#latest-release-via-yum
cd /tmp
wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -ivh epel-release-6-8.noarch.rpm
sudo yum update -y
sudo yum --enablerepo=epel install -y ansible

cd /vagrant/provisioning
sudo ansible-playbook -i local playbook.yml --connection=local
