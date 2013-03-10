class punch{
	exec { "install-punch":
		command => "/usr/local/bin/npm install -g punch",
		creates => "/usr/local/lib/node_modules/punch",
		require => Class["nodejs"]
	}
}