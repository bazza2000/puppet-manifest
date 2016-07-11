class users::dmz::shared {

  $was_users = [
    "01",
    "02",
  ]

  each($was_users) |$was_user| {
    group { "wasgrp${was_user}":
      ensure => 'present',
      gid    => "10${was_user}",
    } ->
    user { "wasadm${was_user}":
      ensure           => 'present',
      gid              => "10${was_user}",
      home             => "/home/wasadm${was_user}",
      shell            => '/bin/bash',
      uid              => "10${was_user}",
    }
  }
}

class users::svc::perf {
  $was_users = [
    "20",
    "21",
  ]

  each($was_users) |$was_user| {
    group { "wasgrp${was_user}":
      ensure => 'present',
      gid    => "10${was_user}",
    } ->
    user { "wasadm${was_user}":
      ensure           => 'present',
      gid              => "10${was_user}",
      home             => "/home/wasadm${was_user}",
      shell            => '/bin/bash',
      uid              => "10${was_user}",
    }
  }

}

class users::svc::oat {
  $was_users = [
    "30",
    "31",
  ]

  each($was_users) |$was_user| {
    group { "wasgrp${was_user}":
      ensure => 'present',
      gid    => "10${was_user}",
    } ->
    user { "wasadm${was_user}":
      ensure           => 'present',
      gid              => "10${was_user}",
      home             => "/home/wasadm${was_user}",
      shell            => '/bin/bash',
      uid              => "10${was_user}",
    }
  }
}
