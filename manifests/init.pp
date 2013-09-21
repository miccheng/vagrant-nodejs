# Puppet manifest for my NodeJS dev machine
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
include nodejsdev