# -*- mode: ruby -*-
# vi: set ft=ruby :

def cache config, name, path
  require 'fileutils'
  require 'pathname'
  name = name.to_s
  local = File.join(File.expand_path('~/.vagrant.d/cache'), config.vm.box, name)
  FileUtils.mkdir_p local
  config.vm.synced_folder local, path
end

Vagrant.configure(2) do |config|
  Vagrant.has_plugin?('vagrant-proxyconf') do
    config.proxy.http = ENV['http_proxy'] if ENV['http_proxy']
    config.proxy.ftp = ENV['ftp_proxy'] if ENV['ftp_proxy']
    config.proxy.no_proxy = ENV['no_proxy'] if ENV['no_proxy']
  end

  config.vm.define('spotted') do |app|
    app.vm.box = 'ubuntu/trusty64'

    app.vm.provider 'virtualbox' do |v|
      v.memory = 4096
      v.name = 'spotted'
    end

    app.vm.network :forwarded_port, guest: 3000, host: 3000

    # Application repos
    app.vm.synced_folder '.', '/home/vagrant/spotted'

    app.ssh.forward_agent = true

    cache app, :apt, '/var/cache/apt/archives'
    cache app, :chef, '/var/chef/cache'
    cache app, :gem, '/var/lib/gems/2.1.0/cache'

    app.vm.provision :chef_solo do |chef|
      chef.version = :latest
      chef.log_level = :debug
      chef.run_list = ['recipe[spotted::development]']
    end
  end
end
