class nodejs ( $version, $logoutput = 'on_failure' ) {
	if ! defined(Package['curl']) {
		package { 'curl':
			ensure => present,
		}
	}
	exec { 'nave' :
		command     => "bash -c \"\$(curl -s 'https://raw.github.com/isaacs/nave/master/nave.sh') usemain $version \"",
		path        => [ "/usr/local/bin", "/bin" , "/usr/bin" ],
		require     => Package[ 'curl' ],
		environment => [ 'HOME=""', 'PREFIX=/usr/local/lib/node', 'NAVE_JOBS=1' ],
		logoutput   => $logoutput,
		timeout     => 0,
		unless      => "test \"v$version\" = \"\$(node -v)\""
	}
}