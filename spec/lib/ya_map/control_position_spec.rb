require 'spec_helper'

describe YaMap::ControlPosition do
  it "should return valid JS" do
    cp = YaMap::ControlPosition.new YaMap::ControlPosition::TOP_LEFT
    cp.to_s.should eql("new YMaps.ControlPosition(#{YaMap::ControlPosition::TOP_LEFT}, new YMaps.Point(5,5))")
  end
  describe "when offset point is passed" do
    it "should return valid JS for ControlPosition with offset point" do
      cp = YaMap::ControlPosition.new YaMap::ControlPosition::TOP_LEFT, :x => 10, :y => 20
      cp.to_s.should eql("new YMaps.ControlPosition(#{YaMap::ControlPosition::TOP_LEFT}, new YMaps.Point(10,20))")
    end
  end
end