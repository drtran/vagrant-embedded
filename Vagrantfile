VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/centos-7.1"
 
  config.vm.network "forwarded_port", guest: 8080, host: 18080
  config.vm.network "forwarded_port", guest: 9000, host: 19000
  config.vm.network "forwarded_port", guest: 3306, host: 13306
  config.vm.network "forwarded_port", guest: 27107, host: 27107
  config.vm.network "forwarded_port", guest: 4444, host: 14444
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provision :shell, path: "bootstrap.sh"

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.name = "csd-embedded"
  end


end