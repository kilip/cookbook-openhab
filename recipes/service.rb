apt_package 'apt-transport-https' do
  action :install
end

apt_repository 'openhab2' do
  uri 'http://dl.bintray.com/openhab/apt-repo2'
  key 'http://bintray.com/user/downloadSubjectPublicKey?username=openhab'
  distribution 'stable'
  components ['main']
  action :add
end

apt_update

%w(openhab2 openhab2-addons).each do |pkg|
  apt_package pkg do
    action :install
  end
end

template '/etc/default/openhab2' do
  source 'openhab2.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

unless node['openhab']['config_repository'].empty?
  git '/etc/openhab2' do
    repository node['openhab']['config_repository']
    action :checkout
  end
end

service 'openhab2' do
  action [:enable, :start]
end

chef_sleep 'waiting openhab to get started' do
  seconds 10
end
