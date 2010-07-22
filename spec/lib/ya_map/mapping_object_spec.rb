require 'spec_helper'

describe YaMap::MappingObject do
  let(:mo) {YaMap::MappingObject.new}
  it "should java scriptify Hash" do
    mo.javascriptify_variable(:icon_content => 'icon').should eql('{iconContent:"icon"}')
  end
  it "should java scriptify Array" do
    mo.javascriptify_variable([:a, 'icon']).should eql('[a,"icon"]')
  end
  it "should java scriptify Nil" do
    mo.javascriptify_variable(nil).should eql('undefined')
  end
  it "should javascriptify method name" do
    mo.javascriptify_method('icon_content').should eql('iconContent')
  end
  it "should return binding JS variable" do
    mo.binding_name.should match(/mapping_object_\d*/i)
    class NewObject < YaMap::MappingObject;end
    NewObject.new.binding_name.should match(/new_object_\d*/i)
  end
end