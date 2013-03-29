class nodejs_from_source
{
  if ! defined(Package['openssl-devel']) {
    package { "openssl-devel":
      ensure  => present
    }
  }
  if ! defined(Package['gcc-c++']) {
    package { "gcc-c++":
      ensure  => present
    }
  }
  if ! defined(Package['gcc']) {
    package { "gcc":
      ensure  => present
    }
  }

  file { "/usr/local/src/node-latest/":
    mode   => 777,
    ensure => "directory"
  }
  exec { "download-nodejs-source":
    command => "wget -N http://nodejs.org/dist/node-latest.tar.gz",
    cwd     => "/usr/local/src/",
    creates => "/usr/local/src/node-latest.tar.gz",
    require => File['/usr/local/src/node-latest/']
  }
  exec { "prepare-build-folder":
    command => "/bin/tar xzf /usr/local/src/node-latest.tar.gz --directory=node-latest --strip-components=1",
    cwd     => "/usr/local/src/",
    creates => "/usr/local/src/node-latest/configure",
    require => Exec["download-nodejs-source"]
  }
  exec { "build-nodejs":
    command => "/usr/bin/make -C /usr/local/src/node-latest",
    cwd     => "/usr/local/src/",
    creates => "/usr/local/src/node-latest/out/Release/node",
    require => [ Exec["prepare-build-folder"], Package["openssl-devel"], Package["gcc-c++"], Package["gcc"] ]
  }
  exec { "install-nodejs-build-artifact":
    command => "/usr/bin/make -C /usr/local/src/node-latest install",
    cwd     => "/usr/local/src/",
    creates => "/usr/local/bin/node",
    require => Exec["build-nodejs"]
  }

  # exec { "install-nodejs-from-source":
  #   command => "wget -N http://nodejs.org/dist/node-latest.tar.gz \
  #   && /bin/mkdir -p /usr/local/src/node-latest \
  #   && /bin/tar xzf /usr/local/src/node-latest.tar.gz --directory=node-latest --strip-components=1 \
  #   && /usr/bin/make -C /usr/local/src/node-latest \
  #   && /usr/bin/make -C /usr/local/src/node-latest install",
  #   cwd     => "/usr/local/src/",
  #   creates => "/usr/local/bin/node",
  #   require => [ Package["openssl-devel"], Package["gcc-c++"], Package["gcc"] ],
  # }
}
