class dmgr::dmz::shared {
  require was::base
  require lvm::dmz::shared
  require users::dmz::shared


  $was_envs = [
    "01",
    "02",
  ]

  each($was_envs) |$was_env| {
    websphere_application_server::instance { "WAS_${was_env}":
      target       => "/opt/IBM/${was_env}/WebSphere85",
      package      => 'com.ibm.websphere.ND.v85',
      version      => '8.5.5009.20160225_0435',
      profile_base => "/opt/IBM/${was_env}/WebSphere85/profiles",
      repository   => '/opt/IBM/repo/repository.config',
    } ->
    websphere_application_server::profile::dmgr { "nf_dmz_mgr_${was_env}":
      instance_base => "/opt/IBM/${was_env}/WebSphere85",
      profile_base  => "/opt/IBM/${was_env}/WebSphere85/profiles",
      cell          => "nf_dmz_mgr_${was_env}_cell",
      node_name     => "nf_dmz_mgr_${was_env}",
      starting_port => "5${was_env}01",
    } ->
    exec { "/opt/IBM/${was_env} chown":
      command => "/bin/chown -R wasadm${was_env}:wasgrp${was_env} /opt/IBM/${was_env}",
      unless  => "/bin/ls -ld /opt/IBM/${was_env}/WebSphere85 | /bin/grep 'wasadm${was_env} wasgrp${was_env}'",
    }

  }

}
