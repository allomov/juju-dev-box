execute "use skel ubuntu colors and aliases" do
  # due to an oppen bug: https://bugs.launchpad.net/juju/+bug/998238
  command <<-BASH
    cp /etc/skel/.bashrc ~/.bashrc
  BASH
end

execute "install azure command line tools" do
  # due to an oppen bug: https://bugs.launchpad.net/juju/+bug/998238
  command <<-BASH
    apt-get install npm && npm install azure-cli -g
  BASH
end

