class was::base {
  require mounts

  class { 'ibm_installation_manager':
    source_dir => '/opt/IBM/IM',
    target     => '/opt/IBM/InstallationManager',
  }

  class { "websphere_application_server":
    user     => "root",
    group    => "root",
    manage_user => false,
    manage_group => false,
    base_dir => '/opt/IBM',
  }

}
