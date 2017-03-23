#
# Cookbook Name:: django
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
rpm_package 'epel-release-7-9.noarch.rpm' do
  provider Chef::Provider::Package::Rpm
  source 'http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm'
  action :install
end

#####  Update package for the rpm downloded above
execute "update package" do
 command "yum update"
 ignore_failure true
 action :nothing
end.run_action(:run)

######  Global Install django through pip
execute "Global Install through pip" do
  command "pip install django; pip install virtualenv;"
end

######  Set up directories to create a virtual environment
execute "Start project and create virtual environment" do
  command "mkdir /root/project; cd /root/project"
end
