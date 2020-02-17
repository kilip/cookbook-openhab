default['openhab']['http_address']                    = '127.0.0.1'
default['openhab']['use_nginx']                       = true
default['openhab']['nginx']['config_path']            = '/etc/nginx/sites-available/default'
default['openhab']['nginx']['server_name']            = 'localhost'
default['openhab']['nginx']['http_listen']            = '80'
default['openhab']['nginx']['https_listen']           = '443'
default['openhab']['nginx']['users']                  = [
  { username: 'foo', password: 'bar' },
]
