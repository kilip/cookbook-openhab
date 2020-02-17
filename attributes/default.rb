# openhab config section
default['openhab']['config_repository'] = ''
default['openhab']['config_dir'] = '/etc/openhab2'

default['openhab']['http_port']     = 8080
default['openhab']['https_port']    = 8443
default['openhab']['http_address']  = '0.0.0.0'
default['openhab']['backups'] = '/var/lib/openhab2/backups'

default['openhab']['extra_java_opts'] = []

# openhab nginx section
default['openhab']['use_nginx']                       = false
default['openhab']['nginx']['install']                = true
default['openhab']['nginx']['config_path']            = '/etc/nginx/sites-enabled/openhab.conf'
default['openhab']['nginx']['server_name']            = 'localhost'
default['openhab']['nginx']['http_listen']            = 80
default['openhab']['nginx']['https_listen']           = 443
default['openhab']['nginx']['ssl_certificate']        = '/etc/ssl/openhab.crt'
default['openhab']['nginx']['ssl_certificate_key']    = '/etc/ssl/openhab.key'
default['openhab']['nginx']['auth_user_file']         = '/etc/nginx/.htpasswd'
default['openhab']['nginx']['auth_basic']             = 'Username and Password Required'
default['openhab']['nginx']['allow']                  = []
default['openhab']['nginx']['users']                  = []
