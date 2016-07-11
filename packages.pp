class packages {

  package { "lvm2":
     ensure => present }
  package { "psmisc":
       ensure => present }
  package { "nfs-utils":
       ensure => present }

}
