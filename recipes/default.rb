#
# Cookbook Name:: nginx-helloworld-m
# Recipe:: default
#
# Copyright (c) 2016 Marcelo Mandolesi, All Rights Reserved.

package 'epel-release'
package 'nginx'

service 'nginx' do
  action [:enable, :start]
end

template 'Apply HelloWorld template' do
  path "#{node['nginx-server']['default-dir']}/index.html"
  source 'helloworld.html.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables(
    :message => node['nginx-server']['message']
  )
  notifies :reload, 'service[nginx]', :immediately
end
