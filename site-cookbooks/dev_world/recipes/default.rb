#
# Cookbook Name:: dev_world
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

# Install VCS
# The Time is GIT!!!

["git", "subversion", "mercurial"].each do |pkg|
  package pkg do
    action :install
  end
end

# Application version controll system
# stow

package "stow" do
  action :install
end

directory "/usr/local/stow" do
  owner root
  group root
  mode 0755
  action :create
  no_if { File.exists "/usr/local/stow" }
end

# Build latest version git

["make", "gcc", "curl-devel","expat-devel", "gettext-devel", "openssl-devel", "zlib-devel"].each do |pkg|
  package pkg do
    action :install
  end
end

directory "/usr/local/src" do
  owner root
  group root
  mode 0755
  action :create
  no_if { File.exists "/usr/local/src"}
end

git "/usr/local/src/git" do
  repository "git://git.kernel.org/pub/scm/git/git.git"
  reference "#{node.git.version}"
  action :checkout
end

bash "install git" do
  cwd '/usr/local/src/git'
  code <<-EOC
   make prefix=/usr/local/stow/#{node.git.version} all
   make prefix=/usr/local/stow/#{node.git.version} install
  EOC
  cwd '/usr/local/stow'
  code <<-EOC
   stow -v #{node.git.version}
  EOC
end
