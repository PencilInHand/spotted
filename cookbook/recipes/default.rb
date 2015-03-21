#
# Cookbook Name:: spotted
# Recipe:: default
#
# Copyright (c) 2015 David Yurek, All Rights Reserved.

include_recipe 'annoyances'
include_recipe 'build-essential'

package 'software-properties-common'
execute 'apt-add-repository --yes ppa:brightbox/ruby-ng'
execute 'apt-get update'

package 'ruby2.1'
package 'ruby2.1-dev'
package 'libruby2.1'

include_recipe 'git'
include_recipe 'spotted::javascript_runtime'

execute 'gem install bundler'
execute 'gem install unicorn'

include_recipe 'nodejs::nodejs_from_source'
include_recipe 'nodejs::npm'
nodejs_npm 'bower'
