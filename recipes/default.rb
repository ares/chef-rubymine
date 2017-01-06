#
# Cookbook Name:: rubymine
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# RubyMine-8.0.3.tar.gz

# Install Sun Java
node.set['java']['install_flavor'] = 'oracle'
node.set['java']['oracle']['accept_oracle_download_terms'] = true
include_recipe 'java'

install_dir = "/usr/local/src"
version = node[:rubymine][:version]
source = node[:rubymine][:source]
rubymine = "RubyMine-#{version}"
tar_file = "#{rubymine}.tar.gz"

remote_file "#{install_dir}/#{tar_file}" do
  action :create_if_missing
  backup false
  source "#{source}#{tar_file}"
  notifies :run, 'script[untar]', :immediately
end

script "untar" do
  interpreter "bash"
  user node[:user]
  group "staff"
  cwd install_dir
  action :nothing
  code <<-EOS
    tar xf #{tar_file}
  EOS
end

link "#{install_dir}/rubymine" do
  to "#{install_dir}/#{rubymine}"
end

# won't copy ~/.RubyMine-80/config as it has 50MB, maybe OC could do that?
