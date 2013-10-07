#
# Cookbook Name:: runcommands
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash "setup zshrc" do
  code <<-EOC
  curl "https://gist.github.com/numa08/6869505/raw/bbdff6b2a9c0befaf0dc380c91b730d683f9ea13/.zshrc" > #{node.user.home}/.zshrc
  EOC
end

bash "setup vimrc" do
  code <<-EOC
  curl "https://gist.github.com/numa08/6869505/raw/e2e593880b2dc9c3b59174e761f3aef48dd73f2d/.vimrc" > #{node.user.home}/.vimrc
  mkdir -p #{node.user.home}/.vim/bundle
  EOC
end

git "#{node.user.home}/.vim/bundle" do
  repository "https://github.com/Shougo/neobundle.vim.git"
  action :checkout
end

bash "setup git setting" do
  code <<-EOC
  curl "https://gist.github.com/numa08/6869505/raw/0ba9c908170de305e11a2834ed763dcae56ff5d5/.git_setting.zsh" > #{node.user.home}/.git_setting.zsh
  EOC
end
                      
bash "setup tmux conf" do
  code <<-EOC
  curl "https://gist.github.com/numa08/6869505/raw/dba67269c215adfc00af8f4a66f1a852abf52d35/.tmux.conf" > #{node.user.home}/.tmux.conf
  EOC
end
