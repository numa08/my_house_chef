#
# Cookbook Name:: desktop
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
bash "install desktop" do
  code <<-EOC
    yum -y groupinstall "X Window System" Desktop
    yum -y groupinstall "Japanese Support"
  EOC
end

package "tigervnc-server" do
  action :install
end

package "xinetd" do
  action :install
end

cookbook_file "/etc/inittab" do
end

cookbook_file "/etc/xinetd.d/vnc-server" do
end

cookbook_file "/etc/gdm/custom.conf" do
end

bash "chkconfig setting" do
  code <<-EOC
   chkconfig vnc-server off
   chkconfig xinetd on
 EOC
end
