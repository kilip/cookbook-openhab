require 'spec_helper.rb'

describe 'openhab::_nginx' do
  config_file = '/etc/nginx/sites-enabled/openhab.conf'
  default_attributes['openhab']['nginx']['install'] = true
  default_attributes['openhab']['nginx']['http_listen'] = 'some-ip:80'
  default_attributes['openhab']['nginx']['https_listen'] = 'some-ip:443'
  default_attributes['openhab']['nginx']['allow'] = ['10.0.0.0/24', '10.0.1.0/24']
  default_attributes['openhab']['nginx']['users'] = [
    {username: 'foo', password: 'bar'},
    {username: 'hello', password: 'world'},
  ];

  describe '~>install nginx' do
    it { is_expected.to install_apt_package('nginx') }
    it { is_expected.to install_apt_package('apache2-utils') }
    it { is_expected.to start_service('nginx') }
  end

  describe '~>configure nginx' do
    it {
      is_expected.to render_file(config_file)
        .with_content(/listen.*some-ip:80\;/)
        .with_content(/listen.*some-ip:443 ssl;/)
        .with_content(/server_name.*localhost;/)
        .with_content(/ssl_certificate.*openhab.crt;/)
        .with_content(/ssl_certificate_key.*openhab.key;/)
        .with_content(/auth_basic.*"Username and Password Required";/)
        .with_content(/auth_basic_user_file.*.htpasswd;/)
        .with_content(%r{allow.*10.0.0.0/24;})
        .with_content(%r{allow.*10.0.1.0/24;})
    }
  end

  describe '~>configure user' do
    password_file = '/etc/nginx/.htpasswd'
    it {
      is_expected.to run_execute('create user foo')
        .with_command("htpasswd -b #{password_file} foo bar")
    }
    it {
      is_expected.to run_execute('create user hello')
        .with_command("htpasswd -b #{password_file} hello world")
    }
  end
end
