#
# Cookbook Name:: runcommands
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/#{node.user.home}/.zshrc" do
  mode 0644
end

cookbook_file "#{node.user.home}/.vimrc" do
  mode 0644
end

cookbook_file "#{node.user.home}/.git_setting.zsh" do
  mode 0644
end

cookbook_file "#{node.user.home}/.tmux.conf" do
  mode 0644
end

bash "setup vimrc" do
  code <<-EOC
  mkdir -p #{node.user.home}/.vim/bundle
  EOC
end

git "#{node.user.home}/.vim/bundle/neobundle.vim" do
  repository "https://github.com/Shougo/neobundle.vim.git"
  action :checkout
end
