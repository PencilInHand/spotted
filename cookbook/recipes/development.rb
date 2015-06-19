#
# Cookbook Name:: spotted
# Recipe:: development
#
# Copyright (c) 2015 David Yurek, All Rights Reserved.

node.set['user'] = 'vagrant'

include_recipe 'spotted::default'

include_recipe 'database::postgresql'

node.set['postgresql']['password']['postgres'] = 'password'
include_recipe 'postgresql::server'
include_recipe 'postgresql::contrib'

file '/tmp/createuser.err' do
  action :delete
end
execute "sudo -u postgres createuser --superuser #{node[:user]} " +
        '2>/tmp/createuser.err ' +
        '|| grep exists /tmp/createuser.err'

default_connection = {username: 'postgres', host: '127.0.0.1'}
db_user = 'spotted'

postgresql_database_user db_user do
  password db_user
  connection default_connection
  action :create
end

%w(development test).each do |db_name_suffix|
  database = "#{db_user}_#{db_name_suffix}"
  postgresql_database database do
    owner db_user
    connection default_connection
    action :create
  end
  postgresql_database_user db_user do
    database_name database
    privileges [:all]
    connection default_connection
    action :grant
  end
end

execute 'gem install foreman'

execute 'bin/bundle' do
  user node[:user]
  environment 'HOME' => "/home/#{node[:user]}"
  cwd "/home/#{node[:user]}/spotted"
end

execute 'bin/rake db:reset' do
  user node[:user]
  environment 'HOME' => "/home/#{node[:user]}"
  cwd "/home/#{node[:user]}/spotted"
  only_if { File.file?("/home/#{node[:user]}/spotted/db/schema.rb") }
end

execute 'bower install --save' do
  user node[:user]
  environment 'HOME' => "/home/#{node[:user]}"
  cwd "/home/#{node[:user]}/spotted"
end
