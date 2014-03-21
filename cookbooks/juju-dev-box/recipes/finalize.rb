execute "use skel ubuntu colors and aliases" do
  # due to an oppen bug: https://bugs.launchpad.net/juju/+bug/998238
  command <<-BASH
    cp /etc/skel/.bashrc ~/.bashrc
  BASH
end
