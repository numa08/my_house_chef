#
# Cookbook Name:: java_devel
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

template ".java.zsh" do
  path "/root/.java.zsh"
  souce ".java.zsh.rtb"
  owner "root"
  group "root"
  mode 0644
end

git "/usr/local/src/ant" do
  repository "git://git.apache.org/ant.git"
  reference "#{node.ant.version}"
  action :checkout
  not_if {File.exists?('/usr/local/bin/ant')}
end

bash "install ant" do
  code <<-EOC
   cd /usr/local/src/ant
   sh build.sh
   mv ./dist /usr/local/stow/ant-#{node.ant.version}
   cd /usr/local/stow
   stow ant-#{node.ant.version}
  EOC
end

git "/usr/local/src/maven" do
  repository "git://git.apache.org/maven.git"
  reference "maven-#{node.mvn.version}"
  action :checkout
  not_if {File.exists?("/usr/local/bin/mvn")}
end

bash "install maven" do
  code <<-EOC
   cd /usr/local/src/maven
   ant
   cd /usr/local/stow
   stow maven-#{node.mvn.version}
  EOC
end
