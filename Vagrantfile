# -*- mode: ruby -*-
# vi: set ft=ruby :

# Required plugins:
# vagrant-vbguest - Automatically installs the host's VirtualBox Guest Additions on the guest system
# vagrant-omnibus https://github.com/chef/vagrant-omnibus
# vagrant-hostmanager

# Optional plugins:
# vagrant-digitalocean - Digital Ocean Provider https://github.com/smdahlen/vagrant-digitalocean
# vagrant-aws - AWS Provider https://github.com/mitchellh/vagrant-aws

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use Ubuntu 14.04 Trusty Tahr 64-bit as our operating system
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "sharetribe.mac"

  #
  # Managing /etc/hosts
  #
  # Update host's /etc/hosts file
  config.hostmanager.manage_host = true
  # But don't change guest's /et/hosts
  config.hostmanager.enabled = false
  # Also, set this aliases...
  config.hostmanager.aliases = []

  #
  # VirtualBox provider
  #
  config.vm.provider :virtualbox do |vb, override|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ['modifyvm', :id, '--name', "Sharetribe"]

    override.vm.network :forwarded_port, guest: 80, host: 3210
    override.vm.network :private_network, ip: "192.168.69.69"
    # Keep the insecure private key
    override.ssh.insert_key = false
  end

  #
  # AWS provider
  #
  config.vm.provider :aws do |aws, override|
    # more info at https://github.com/mitchellh/vagrant-aws
    aws.access_key_id = "YOUR KEY"
    aws.secret_access_key = "YOUR SECRET KEY"

    aws.region = "us-east-1"

    # Machine configuration
    aws.ami = "ami-4d883350"        # Ubuntu 14.04.2 LTS (Trusty Tahr)
    aws.instance_type = "t2.micro"  # Free Tier eligible, 1 vCPU, 1 GB ram
    aws.block_device_mapping = [{ 'DeviceName' => '/dev/sda1', 'Ebs.VolumeSize' => 15 }]
    aws.tags = {
      'Name' => 'Sharetribe',
    }

    # Remote access and security
    aws.keypair_name = "KEYPAIR NAME"
    override.ssh.username = "ubuntu"
    override.ssh.private_key_path = "PATH TO YOUR PRIVATE KEY"
    aws.security_groups = "web"
  end

  #
  # Digital Ocean provider
  #
  config.vm.provider :digital_ocean do |provider, override|
    # More info at https://github.com/smdahlen/vagrant-digitalocean
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    provider.token = 'YOUR TOKEN'
    provider.image = 'ubuntu-14-04-x64'
    provider.region = 'nyc2'
    provider.size = '512mb'

    override.ssh.username = "root"
    override.ssh.private_key_path = 'PATH TO YOUR PRIVATE KEY'
  end

  # Use Chef Solo to provision our virtual machine
  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    # Uncomment to set chef log level to debug
    #chef.log_level          = "debug"

    chef.cookbooks_path     = ["chef/cookbooks", "chef/site-cookbooks"]

    chef.add_recipe "sharetribe"

    chef.json = {
      :env => 'development',
      :app => {
        :name => 'sharetribe',
        :path => '/var/www',
        :domain => 'localhost',
        :user => 'app',
        :group => 'www-data'
      },
      :git => {
        :repo => 'https://github.com/sharetribe/sharetribe.git',
        :branch => 'master'
      },
      :db => {
        :install_server => true,
        :create_db => true,
        :create_user => true,
        :vendor => 'mariadb',
        :name => 'sharetribe_development',
        :user => 'sharetribe',
        :password => 'secret',
        :root_password => 'secret',
        :host => 'localhost',
        :socket => nil
      },
      # String[]
      :ssh_keys => [
        # Add ssh public keys here and they will be added
        # to the ubuntu and app users authorized_keys files
      ]
    }
  end
end
