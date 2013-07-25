# Puppet manifest for my NodeJS dev machine
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

import "classes/*.pp"

class nodejsdev{
	include yum
	include iptables
	include misc
	#include db
	include node_dev
	#include punch
}

include nodejsdev
