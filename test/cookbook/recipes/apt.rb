node.default['apt']['http_proxy'] = 'http://medusa.itstoni.com:3128'
node.default['apt']['https_proxy'] = 'http://medusa.itstoni.com:3128'

remote_directory '/var/cache/apt/archives' do
  source 'apt'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  recursive true
end
