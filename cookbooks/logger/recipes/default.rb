#
# Cookbook Name:: logger
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template "/etc/rsyslog.d/25-logger.conf" do
	variables :inputs_count => 200, :log_dest => "192.168.33.49"
	source "logger.erb"
	owner "root"
	group "root"
	mode "0644"
end
