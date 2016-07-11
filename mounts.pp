class mounts {

  file { "/config":
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0775',
  }

  file { "/logs":
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0775',
  }

  mount   { "/opt/IBM/repo":
       device  => "puppet:/opt/IBM/repo",
       ensure  => "mounted",
       fstype  => "nfs",
       options => "defaults",
       atboot  => "true",
  }

  mount   { "/opt/IBM/IM":
       device  => "puppet:/opt/IBM/IM",
       ensure  => "mounted",
       fstype  => "nfs",
       options => "defaults",
       atboot  => "true",
  }

}
