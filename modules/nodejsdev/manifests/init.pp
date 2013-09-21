# Puppet manifest for my NodeJS dev machine
class nodejsdev{
	require yum
	include iptables
	include misc
	#include db
	include node_dev
	#include punch
}