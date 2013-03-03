class node_from_source{
  if ! defined(Package['openssl-devel']) {
    package { "openssl-devel":
      ensure  => present,
    }
  }
  if ! defined(Package['gcc-c++']) {
    package { "gcc-c++":
      ensure  => present,
    }
  }
  if ! defined(Package['gcc']) {
    package { "gcc":
      ensure  => present,
    }
  }
  exec { "install-nodejs-from-source":
    command => "wget -N http://nodejs.org/dist/node-latest.tar.gz \
    && /bin/mkdir -p /usr/local/src/node-latest \
    && /bin/tar xzf /usr/local/src/node-latest.tar.gz --directory=node-latest --strip-components=1 \
    && /usr/bin/make -C /usr/local/src/node-latest \
    && /usr/bin/make -C /usr/local/src/node-latest install",
    cwd     => "/usr/local/src/",
    creates => "/usr/local/bin/node",
    require => [ Package["openssl-devel"], Package["gcc-c++"], Package["gcc"] ],
  }
}