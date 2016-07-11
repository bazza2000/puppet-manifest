class node::dmz::shared {
  require lvm::dmz::shared

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
    websphere_application_server::profile::appserver { "nf_dmz_node_${was_env}_01":
      instance_base  => "/opt/IBM/${was_env}/WebSphere85",
      profile_base   => "/opt/IBM/${was_env}/WebSphere85/profiles",
      cell           => "nf_dmz_mgr_${was_env}_cell",
      template_path  => "/opt/IBM/${was_env}/WebSphere85/profileTemplates/managed",
      dmgr_host      => "${dmgr_host}",
      node_name      => "nf_dmz_node_${was_env}_01",
    } ->
    websphere_application_server::cluster { "fn_pre_${was_env}_01_01_cl":
      profile_base => "/opt/IBM/${was_env}/WebSphere85/profiles",
      dmgr_profile => "nf_dmz_node_${was_env}_01",
      cell         => "nf_dmz_mgr_${was_env}_cell",
    } ->
    websphere_application_server::cluster::member { "fn_pre_${was_env}_01_01":
      ensure                           => 'present',
      cluster                          => "fn_pre_${was_env}_01_01_cl",
      node                             => "nf_dmz_node_${was_env}_01",
      cell                             => "nf_dmz_mgr_${was_env}_cell",
      jvm_initial_heap_size            => '64',
      jvm_maximum_heap_size            => '128',
      profile_base                     => "/opt/IBM/${was_env}/WebSphere85/profiles",
      dmgr_profile                     => "nf_dmz_node_${was_env}_01",
    } ->
    websphere_application_server::cluster { "fn_orc_${was_env}_01_01_cl":
      profile_base => "/opt/IBM/${was_env}/WebSphere85/profiles",
      dmgr_profile => "nf_dmz_node_${was_env}_01",
      cell         => "nf_dmz_mgr_${was_env}_cell",
    } ->
    websphere_application_server::cluster::member { "fn_orc_${was_env}_01_01":
      ensure                           => 'present',
      cluster                          => "fn_orc_${was_env}_01_01_cl",
      node                             => "nf_dmz_node_${was_env}_01",
      cell                             => "nf_dmz_mgr_${was_env}_cell",
      jvm_initial_heap_size            => '64',
      jvm_maximum_heap_size            => '128',
      profile_base                     => "/opt/IBM/${was_env}/WebSphere85/profiles",
      dmgr_profile                     => "nf_dmz_node_${was_env}_01",
    } ->
    exec { "/opt/IBM/${was_env} chown":
      command => "/bin/chown -R wasadm${was_env}:wasgrp${was_env} /opt/IBM/${was_env}",
      unless  => "/bin/ls -ld /opt/IBM/${was_env}/WebSphere85 | /bin/grep 'wasadm${was_env} wasgrp${was_env}'",
    }

  }
}
