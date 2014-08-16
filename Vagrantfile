# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use Ubuntu 14.04 Trusty Tahr 64-bit as our operating system
  config.vm.box = "ubuntu/trusty64"

  # Configurate the virtual machine to use 2GB of RAM
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.network "private_network", ip: "192.168.72.72"

  # Forward the Rails server default port to the host
  # config.vm.network :forwarded_port, guest: 3000, host: 3000
  #config.vm.network :forwarded_port, guest: 80, host: 8080

  # Use Chef Solo to provision our virtual machine
  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]

    chef.add_recipe "apt"
    chef.add_recipe "nodejs"
    chef.add_recipe "build-essential"
    chef.add_recipe "ruby_build"
    chef.add_recipe "rbenv::vagrant"
    chef.add_recipe "rbenv::system"
    chef.add_recipe "vim"
    chef.add_recipe "mysql::server"
    chef.add_recipe "mysql::client"
    chef.add_recipe "apache2"
    chef.add_recipe "passenger_apache2"
    chef.add_recipe "reactions"

    # Install Ruby 2.1.2 and Bundler
    # Set an empty root password for MySQL to make things simple
    chef.json = {
      rbenv: {
        rubies: [ "2.1.2" ],
        upgrade: true,
        global: "2.1.2",
        gems: {
          "2.1.2" => [
            { name: "chef" },
            { name: "ohai" },
            { name: "bundler" },
            { name: "passenger" },
          ]
        }
      },
      mysql: {
        server_root_password: 'none'
      },
      apache: {
        default_site_enabled: false
      },
      passenger: {
        version: '4.0.48',

      }
    }

    config.vm.provision "shell", inline: "cd /vagrant && bundle install && rake db:create db:migrate", privileged: false
  end
end
