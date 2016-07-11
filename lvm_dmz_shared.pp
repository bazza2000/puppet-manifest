class lvm::dmz::shared {

  $lvm_envs = [
    "log",
    "bin",
    "config",
  ]

  $was_envs = [
    "01",
    "02",
  ]

  each($was_envs) |$was_env| {
    lvm::volume { "configlv_${was_env}":
      ensure => present,
      vg     => 'vg01',
      pv     => '/dev/xvdb',
      fstype => 'ext4',
      size   => '2G',
    } ->
    file { "/config/${was_env}":
      ensure => 'directory',
      owner  => "wasadm${was_env}",
      group  => "wasgrp${was_env}",
      mode   => '0750',
    } ->
    mount { "/config/${was_env}":
      device  => "/dev/vg01/configlv_${was_env}",
      fstype  => "ext4",
      ensure  => "mounted",
      options => "defaults",
      atboot  => "true",
      require => File["/config"],
    } ->
    lvm::volume { "logslv_${was_env}":
      ensure => present,
      vg     => 'vg01',
      pv     => '/dev/xvdb',
      fstype => 'ext4',
      size   => '2G',
    } ->
    file { "/logs/${was_env}":
      ensure => 'directory',
      owner  => "wasadm${was_env}",
      group  => "wasgrp${was_env}",
      mode   => '0750',
    } ->
    mount { "/logs/${was_env}":
      device  => "/dev/vg01/logslv_${was_env}",
      fstype  => "ext4",
      ensure  => "mounted",
      options => "defaults",
      atboot  => "true",
      require => File["/logs"],
    } ->
    lvm::volume { "waslv_${was_env}":
      ensure => present,
      vg     => 'vg01',
      pv     => '/dev/xvdb',
      fstype => 'ext4',
      size   => '2G',
    } ->
    file { "/opt/IBM/${was_env}":
      ensure => 'directory',
      owner  => "wasadm${was_env}",
      group  => "wasgrp${was_env}",
      mode   => '0750',
    } ->
    mount { "/opt/IBM/${was_env}":
      device  => "/dev/vg01/waslv_${was_env}",
      fstype  => "ext4",
      ensure  => "mounted",
      options => "defaults",
      atboot  => "true",
    }

  }

}
