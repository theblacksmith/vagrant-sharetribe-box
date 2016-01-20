Sharetribe box for Vagrant
========================

A Vagrant box for [Sharetribe](http://github.com/sharetribe/sharetribe)

Prerequisites
------------

Only one actually: `librarian-chef`. If you don't have it, just run `gem install librarian-chef` and you are good to go

> **Note:** I'm assuming you already have Vagrant installed!

Usage
------------

1. clone this repo and `cd` into the project folder
2. run `./install-required-plugins.sh` to install required pluginx
3. run `vagrant up`
4. Get up and dance in celebration of the easiest Sharetribe install ever! (while you wait for it to instal. Yeah. It takes a while :)

Go live
------------

They have not been tested yet... but they should work. 

1. Install the relevant plugin (either `vagrant-digitalocean` or `vagrant-aws`)
2. Open the `Vagrantfile` file, find the section for the provider you want to use and fill in the blanks
3. Run `vagrant up --provider aws` or `vagrant up --provider digitalocean`


Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `feature-x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

License: MIT <br>
Authors: [The Blacksmith](http://github.com/theblacksmith) (a.k.a. [Saulo Vallory](http://saulovallory.com))
