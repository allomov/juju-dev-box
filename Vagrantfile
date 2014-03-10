# -*- mode: ruby -*-
# vi: set ft=ruby :

VM_MEMORY = 4*1024
VM_CORES = 4

Vagrant.configure('2') do |config|

  config.vm.box = 'trusty64'
  config.vm.hostname = 'cf-juju'
  config.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
  config.vm.network :private_network, ip: '192.168.50.4'

  config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=755", "fmode=755"]
  #config.vm.synced_folder 'cf-charms', '/home/vagrant/cf-charms', mount_options: ['dmode=755', 'fmode=755']


  config.vm.provider :virtualbox do |vb|

    vb.customize ['modifyvm', :id, '--memory', VM_MEMORY]
    vb.customize ['modifyvm', :id, '--cpus', VM_CORES]
  end

  #config.vm.provision :puppet do |puppet|
  #  puppet.manifests_path = 'manifests'
  #  puppet.manifest_file  = 'base.pp'
  #end

  config.vm.provision :chef_solo do |chef|
  #   cookbooks.cookbooks_path = '../my-recipes/cookbooks'
     chef.add_recipe 'juju::bootstrap'
     chef.add_recipe 'juju::juju-gui'
     chef.add_recipe 'juju::charm-development'

  #   cookbooks.json = { :mysql_password => 'foo' }
  end

end
