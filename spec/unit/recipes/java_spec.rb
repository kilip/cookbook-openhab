require 'spec_helper.rb'

describe 'openhab::default' do
  platform 'ubuntu'

  describe 'add zulu repository' do
    it { is_expected.to add_apt_repository('zulu-java').with_uri('http://repos.azulsystems.com/ubuntu') }
  end

  describe 'install java' do
    it { is_expected.to install_apt_package('zulu-8') }
  end
end
