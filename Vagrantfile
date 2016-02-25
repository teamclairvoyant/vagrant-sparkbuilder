# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-7.2"
  config.vm.hostname = "sparkbuilder"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Customize the amount of memory on the VM:
  config.vm.provider "virtualbox" do |v|
    v.memory = "2048"
    v.cpus = "2"
  end
  config.vm.provider "vmware_workstation" do |v|
    v.vmx["memsize"] = "2048"
    v.vmx["numvcpus"] = "2"
  end
  config.vm.provider "vmware_fusion" do |v|
    v.vmx["memsize"] = "2048"
    v.vmx["numvcpus"] = "2"
  end

  # http://fgrehm.viewdocs.io/vagrant-cachier/
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.enable :yum
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    yum -y -e1 -d1 install deltarpm epel-release
  SHELL

  if Vagrant.has_plugin?("vagrant-puppet-install")
    config.puppet_install.puppet_version = :latest
  else
    config.vm.provision "shell", inline: <<-SHELL
      yum -y -e1 -d1 install epel-release
      yum -y -e1 -d1 install puppet
    SHELL
  end

  config.vm.provision :puppet do |puppet|
    #puppet.module_path = "modules"
    puppet.environment_path = "."
    #puppet.environment = "production"
  end
end
