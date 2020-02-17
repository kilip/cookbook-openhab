apt_repository 'zulu-java' do
  uri 'http://repos.azulsystems.com/ubuntu'
  distribution 'stable'
  components ['main']
  keyserver 'hkp://keyserver.ubuntu.com:80'
  key '0xB1998361219BD9C9'
  action :add
end

apt_package 'zulu-8' do
  action :install
end
