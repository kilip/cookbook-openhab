require 'spec_helper.rb'

describe 'openhab::service' do
  default_attributes['openhab']['config_repository'] = 'git@github.com:foo/bar.git'

  describe 'add openhab repository' do
    it { is_expected.to add_apt_repository('openhab2') }
  end

  describe 'install openhab' do
    it { is_expected.to install_apt_package('apt-transport-https') }
    it { is_expected.to install_apt_package('openhab2') }
    it { is_expected.to install_apt_package('openhab2-addons') }
  end

  describe 'checkout git repository' do
    it {
      is_expected.to checkout_git('/etc/openhab2')
        .with(repository: 'git@github.com:foo/bar.git')
    }
  end

  describe 'render config template' do
    file = '/etc/default/openhab2'
    it {
      is_expected.to render_file(file)
        .with_content(/.*HTTP_PORT.+= 8080/)
        .with_content(/.*HTTPS_PORT.+= 8443/)
        .with_content(/.*HTTP_ADDRESS.+= '0.0.0.0'/)
    }
  end
end
