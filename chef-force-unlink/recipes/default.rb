#
# Cookbook Name:: force-unlink
# Recipe:: default
#

template node["force-unlink"]["target"] do
  source "contents.erb"
  owner "root"
  group "root"
  mode "0755"
  force_unlink true
  notifies :restart, "service[unlinked]"
end

service "unlinked" do
  restart_command "test -x #{node["force-unlink"]["target"]}"
  start_command "test -x #{node["force-unlink"]["target"]}"
  stop_command "test -x #{node["force-unlink"]["target"]}"
end
