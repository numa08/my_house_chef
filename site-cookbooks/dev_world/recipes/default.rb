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

package "git" do
  action :install
  options "-y"
  not_if {File.exists?('/usr/local/bin/git')}
end

["subversion", "mercurial"].each do |pkg|
  package pkg do
    action :install
    options "-y"
  end
end

# Application version controll system
# stow

package "stow" do
  action :install
  options "-y"
end

directory "/usr/local/stow" do
  owner "root"
  group "root"
  mode 0755
  action :create
  not_if { File.exists?("/usr/local/stow") }
end

["make", "gcc", "autoconf", "automake"].each do |pkg|
  package pkg do
    action :install
    options "-y"
  end
end

# Build latest version git

["curl-devel","expat-devel", "gettext-devel", "openssl-devel", "zlib-devel", "perl-devel"].each do |pkg|
  package pkg do
    action :install
    options "-y"
  end
end

directory "/usr/local/src" do
  owner "root"
  group "root"
  mode 0755
  action :create
  not_if { File.exists?("/usr/local/src")}
end

git "/usr/local/src/git" do
  repository "git://git.kernel.org/pub/scm/git/git.git"
  reference "#{node.git.version}"
  action :checkout
end

bash "install git" do
  code <<-EOC
   cd /usr/local/src/git
   make clean
   make prefix=/usr/local/stow/git-#{node.git.version} all
   make prefix=/usr/local/stow/git-#{node.git.version} install
   cd /usr/local/stow
   stow -v git-#{node.git.version}
  EOC
  not_if {File.exists?('/usr/local/bin/git')}
end

package "git" do
  action :remove
  options "-y"
end

# Build latest version zsh

git "/usr/local/src/zsh" do
  repository "git://git.code.sf.net/p/zsh/code"
  reference "#{node.zsh.version}"
  action :checkout
  not_if {File.exists?('/usr/local/bin/zsh')}
end

bash "install zsh" do
  code <<-EOC
   cd /usr/local/src/zsh
   autoconf
   ./configure --prefix=/usr/local/stow/zsh-#{node.zsh.version}
   make
   make install
   cd /usr/local/stow/
   stow -v zsh-#{node.zsh.version}
  EOC
  not_if {File.exists?('/usr/local/bin/zsh')}
end

mercurial "/usr/local/src/vim" do
  repository "https://vim.googlecode.com/hg/"
  reference "#{node.vim.version}"
  action :sync
end
