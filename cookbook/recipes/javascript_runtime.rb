# Cookbook Name:: spotted
# Recipe:: javascript_runtime
#
# Copyright (c) 2015 David Yurek, All Rights Reserved.
#

package 'nodejs'
package 'npm'

link '/usr/bin/node' do
  to '/usr/bin/nodejs'
end
