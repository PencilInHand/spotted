#
# Cookbook Name:: spotted
# Recipe:: development
#
# Copyright (c) 2015 David Yurek, All Rights Reserved.

node.set['user'] = 'vagrant'

include_recipe 'spotted::default'

package 'postgresql'
package 'postgresql-contrib'
package 'libpq-dev'

execute 'gem install foreman'

file '/tmp/createuser.err' do
  action :delete
end
execute "sudo -u postgres createuser --superuser #{node[:user]} " +
        '2>/tmp/createuser.err ' +
        '|| grep exists /tmp/createuser.err'


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
