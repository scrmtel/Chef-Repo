#
# Cookbook Name:: postgresql
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#
# Cookbook:: postgresql
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
##### 4: Download required rpm packages for python  and postgres
rpm_package 'epel-release-7-9.noarch.rpm' do
  provider Chef::Provider::Package::Rpm
  source 'http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm'
  action :install
end

##### 5: Update package for the rpm downloded above
execute "update package" do
 command "yum update"
 ignore_failure true
 action :nothing
end.run_action(:run)

###### 6: Set up Postgresql with psycopg2 and python django required packages #######
%w{postgresql postgresql-server postgresql-contrib python-django python-pip python-psycopg2}.each do |pkg|
package pkg do
     action :install
  end
end

###### 7: Make sure postgresql service working and running fine
execute "Start Postgres daemon and enable it to start on boot" do
  command "service postgresql initdb; service postgresql start; chkconfig postgresql on"
end

