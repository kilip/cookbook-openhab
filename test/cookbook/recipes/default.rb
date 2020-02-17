
include_recipe 'test::apt'
include_recipe 'openhab::java'
include_recipe 'openhab::service'

ruby_block 'Save node attributes' do
  block do
    IO.write('/tmp/kitchen/chef_node.json', node.to_json)
  end
end
