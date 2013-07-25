class punch{
	exec { "install-punch":
		command => "/usr/local/bin/npm install -g punch",
		creates => "/usr/local/lib/node_modules/punch",
		require => Class["nodejs"]
	}
	exec { "install-punch-blog":
		command => "/usr/local/bin/npm install -g punch-blog-content-handler",
		creates => "/usr/local/lib/node_modules/punch-blog-content-handler",
		require => Class["nodejs"]
	}
}
