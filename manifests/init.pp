# Puppet manifest for my NodeJS dev machine
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
class nodejsdev{
	require yum
	include iptables
	include misc
	#include db
	include node_dev
}
include nodejsdev