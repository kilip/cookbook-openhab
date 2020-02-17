if node['openhab']['nginx']['install']
  %w(nginx apache2-utils).each do |pkg|
    apt_package pkg do
      action :install
    end
  end

  service 'nginx' do
    action :start
  end
end

template node['openhab']['nginx']['config_path'] do
  source 'nginx.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

node['openhab']['nginx']['users'].each do |user|
  passwd_file = node['openhab']['nginx']['auth_user_file']

  file passwd_file do
    owner 'root'
    group 'root'
    mode '0644'
    action :touch
  end

  execute "create user #{user['username']}" do
    command "htpasswd -b #{passwd_file} #{user['username']} #{user['password']}"
    action :run
    sensitive true
  end
end
