#
# Cookbook Name:: java_devel
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute


git "/usr/local/src/ant" do
  repository "git://git.apache.org/ant.git"
  reference "#{node.ant.version}"
  action :checkout
  not_if {File.exists?('/usr/local/bin/ant')}
end


git "/usr/local/src/maven" do
  repository "git://git.apache.org/maven.git"
  reference "#{node.mvn.version}"
  action :checkout
  not_if {File.exists?("/usr/local/bin/mvn")}
end
