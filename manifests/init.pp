# Puppet manifest for my NodeJS dev machine
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
class phpdevweb{
	require yum
	include iptables
	include misc
	#include db
	include node_dev
}
include phpdevweb