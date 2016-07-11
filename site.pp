$dmgr_host='ip-172-31-23-131.eu-west-1.compute.internal'
$dmz_host='ip-172-31-26-203.eu-west-1.compute.internal'
$svc_perf_host='ip-172-31-16-26.eu-west-1.compute.internal'
$svc_oat_host1='ip-172-31-16-77.eu-west-1.compute.internal'
$svc_oat_host2='ip-172-31-29-61.eu-west-1.compute.internal'

node default {
  include linux::default
}

# DMGR
node 'ip-172-31-23-131.eu-west-1.compute.internal' {
  include linux::default
  include mounts
  include puppet_agent
  include packages
  include lvm::dmz::shared
  include lvm::svc::perf
  include lvm::svc::oat
  include users::dmz::shared
  include users::svc::perf
  include users::svc::oat
  include was::base
  include dmgr::dmz::shared
  include dmgr::svc::perf
  include dmgr::svc::oat
}

# DMZ NODE
node 'ip-172-31-26-203.eu-west-1.compute.internal' {
  include linux::default
  include mounts
  include puppet_agent
  include packages
  include lvm::dmz::shared
  include users::dmz::shared
  include was::base
  include node::dmz::shared
}

# SVC PERF NODE
node 'ip-172-31-16-26.eu-west-1.compute.internal' {
  include linux::default
  include mounts
  include puppet_agent
  include packages
  include lvm::svc::perf
  include users::svc::perf
  include was::base
  include node::svc::perf
}

# SVC OAT NODE 1
node 'ip-172-31-16-77.eu-west-1.compute.internal' {
  include linux::default
  include mounts
  include puppet_agent
  include packages
  include lvm::svc::oat
  include users::svc::oat
  include was::base
  include node::svc::oat::a
}

# SVC OAT NODE 2
node 'ip-172-31-29-61.eu-west-1.compute.internal' {
  include linux::default
  include mounts
  include puppet_agent
  include packages
  include lvm::svc::oat
  include users::svc::oat
  include was::base
  include node::svc::oat::b
}

node 'ip-172-31-27-9.eu-west-1.compute.internal' {
  include linux::default
}

node 'ip-172-31-17-106.eu-west-1.compute.internal' {
  include jenkins
}
