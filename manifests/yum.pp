class yum {
  exec { 'yum-update':
    command => '/usr/bin/yum -y update'
  }
}