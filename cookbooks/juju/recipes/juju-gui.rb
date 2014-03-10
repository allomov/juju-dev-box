execute "deploy juju-gui" do
  command <<-BASH
    su - vagrant -c "juju deploy juju-gui"
    su - vagrant -c "juju expose juju-gui"
  BASH
end