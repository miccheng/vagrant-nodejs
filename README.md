# Basic Vagrant VM for NodeJS Development #

Installs:

* [NodeJS](http://nodejs.org/) via [Nave](https://github.com/isaacs/nave)
* [Grunt](http://gruntjs.com/) - The Javascript Task Runner
* [PhantomJS](http://phantomjs.org/) - Headless WebKit with JavaScript API

### Installation ###

1. Checkout the git repo.
2. Install Vagrant:

	```bash
$ gem install vagrant
```

3. Start vagrant: 

	```bash
$ vagrant up
```

4. Put your project in `projects` folder.
5. Login to the VM:

	```bash
$ vagrant ssh
```

