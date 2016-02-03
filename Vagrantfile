Vagrant.configure("2") do |config|
  config.vm.hostname = "drupal-8"
  config.vm.box = "ubuntu/trusty64"

  config.vm.network :forwarded_port, guest: 80, host: 9000
  config.vm.network :forwarded_port, guest: 5555, host: 5555
  config.vm.boot_timeout = 120

  config.vm.synced_folder ".", "/var/www",
    owner: "vagrant", group: "www-data"

  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest

  config.vm.provision :shell, :inline => "ulimit -n 4048"
  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      "recipe[drupal-8::default]"
    ]
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end
end