
openssl_x509_certificate '/etc/ssl/openhab.crt' do
  common_name 'test.itstoni.com'
  org 'DoyoLabs'
  country 'ID'
end

include_recipe 'openhab::default'
