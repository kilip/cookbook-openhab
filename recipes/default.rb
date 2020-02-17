#
# Cookbook:: openhab
# Recipe:: default
#
# Copyright:: 2020, Anthonius, All Rights Reserved.

include_recipe 'openhab::java'
include_recipe 'openhab::service'

if node['openhab']['use_nginx']
  include_recipe 'openhab::_nginx'
end
