package "python-pip" do
  action :install
end

package "git" do
  action :install
end

package "bzr" do
  action :install
end


package "charm-tools" do
    action :install
end

execute "install charm helpers" do
  command <<-BASH
    su - vagrant -c "bzr branch lp:charm-helpers"
  BASH
  not_if { ::File.exists?('/home/vagrant/charm-helpers') }
end