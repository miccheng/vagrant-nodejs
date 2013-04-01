class node_dev{
	class { 'nodejs':
		version => $node_version,
	}
	# class { 'nodejs_from_source': }

	exec { "install-grunt":
		command => "/usr/local/bin/npm install -g grunt-cli",
		creates => "/usr/local/lib/node_modules/grunt-cli",
		require => Class["nodejs"]
	}
	package { "fontconfig-devel":
	    ensure  => present,
	}
	package { "freetype-devel":
	    ensure  => present,
	}
	exec { "install-phantomjs":
		command => "wget -N http://phantomjs.googlecode.com/files/phantomjs-1.8.2-linux-x86_64.tar.bz2 \
		&& /bin/tar jxf /usr/local/src/phantomjs-1.8.2-linux-x86_64.tar.bz2 \
		&& cp /usr/local/src/phantomjs-1.8.2-linux-x86_64/bin/phantomjs /usr/local/bin/",
		cwd => "/usr/local/src/",
		creates => "/usr/local/bin/phantomjs",
		require => Package["freetype-devel", "fontconfig-devel"]
	}
}
