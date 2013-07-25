class iptables {

  package { "iptables": 
    ensure => present;
  }

  service { "iptables":
    require => Package["iptables"],

    hasstatus => true,
    status => "true",

    # hasrestart => false,

  }

  file { "/etc/sysconfig/iptables":
    owner   => "root",
    group   => "root",
    mode    => 600,
    replace => true,
    ensure  => present,
    # source  => "puppet:///files/iptables.txt",
    source  => "/vagrant/files/iptables.txt",
    # content => template("puppet:///templates/iptables.txt"),
    require => Package["iptables"],

    notify  => Service["iptables"],
    ;
  }

}