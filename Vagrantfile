# -*- mode: ruby -*-
# vi: set ft=ruby :

VM_MEMORY = 4*1024
VM_CORES = 4

Vagrant.configure('2') do |config|

  config.vm.box = 'trusty64'
  config.vm.hostname = 'cf-juju'
  config.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
  config.vm.network :private_network, ip: '192.168.50.4'

  config.vm.synced_folder "~/work/github/cf-charms", "/vagrant", mount_options: ["dmode=755", "fmode=755"]

  # be sure that `ssh-add -L` return your key
  # Max OS X can require reboot after you update your ssh agent
  # config.ssh.private_key_path = "~/.ssh/id_rsa"
  # config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', VM_MEMORY]
    vb.customize ['modifyvm', :id, '--cpus', VM_CORES]
  end

  config.vm.provision :chef_solo do |chef|
  #   cookbooks.cookbooks_path = '../my-recipes/cookbooks'
     chef.add_recipe 'juju::bootstrap'
     chef.add_recipe 'juju::juju-gui'
     chef.add_recipe 'juju::charm-development'
     chef.add_recipe 'juju-dev-box::finalize'
  #   cookbooks.json = { :mysql_password => 'foo' }
  end

end
