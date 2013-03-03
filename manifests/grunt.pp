class grunt{
  exec { "npm-install-grunt":
    command => "npm install -g grunt-cli",
    #creates => "/usr/local/bin/node",
    require => Exec["install-nodejs-from-source"],
  }
}