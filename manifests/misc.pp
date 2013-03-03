class misc {

  File {
    owner   => "root",
    group   => "root",
    mode    => 644,
    require => Package["httpd"],
    notify  => Service["httpd"]
  }

  exec { "grap-epel":
    command => "/bin/rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm",
    creates => "/etc/yum.repos.d/epel.repo",
    alias   => "grab-epel",
  }

  package { "vim-enhanced":
    ensure  => present,
  }

}