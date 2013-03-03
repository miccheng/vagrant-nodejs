class node_dev{
	class { 'nodejs':
		version => '0.8.21',
	}
	exec { "install-grunt":
		command => "/usr/local/bin/npm install -g grunt-cli",
		creates => "/usr/local/lib/node_modules/grunt-cli",
	}
}