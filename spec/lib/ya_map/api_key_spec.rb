require 'spec_helper'

YaMap::ApiKey::RAILS_ROOT = 'RAILS_ROOT'
YaMap::ApiKey::RAILS_ENV = 'test'

describe YaMap::ApiKey do
  it "should return valid API Key" do
    YAML.should_receive(:load_file).and_return({'test' => 'test'})
    YaMap::ApiKey.get.should eql('test')
  end
end