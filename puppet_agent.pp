class puppet_agent {

  service {'puppet':
    ensure => 'stopped',
    enable => 'false',
  }

}
