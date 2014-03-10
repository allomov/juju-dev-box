execute "enable zookeeper to connecting back to the host by disabling firewall" do
  # due to an oppen bug: https://bugs.launchpad.net/juju/+bug/998238
  command <<-BASH
    ufw disable
  BASH
end

bash "install juju repository" do
  # Why devel and not stable?
  code <<-EOH
  add-apt-repository -y ppa:juju/devel && apt-get update
  EOH
end

bash "install juju" do
  code <<-EOH
  apt-get install -y juju-core juju-local
  EOH
end

execute "initialize juju environment variables" do
  command <<-BASH
    su - vagrant -c "echo 'export JUJU_HOME=/home/vagrant/.juju' >> /home/vagrant/.bash_profile"
  BASH
  not_if { ::File.exists?('/home/vagrant/.bash_profile') }
end

execute "generate a generic juju configuration file and then switching to the local provider" do
  command <<-BASH
    su - vagrant -c 'juju generate-config'
    su - vagrant -c 'juju switch local'
  BASH
  not_if { ::File.exists?('/home/vagrant/.juju/environments.yaml') }
end

execute "bootstrap juju environment" do
  command <<-BASH
    su - vagrant -c 'juju bootstrap'
  BASH
  not_if { ::File.exists?('/home/vagrant/.juju/local') }
end