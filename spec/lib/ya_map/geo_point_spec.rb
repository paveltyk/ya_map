require 'spec_helper'

describe YaMap::GeoPoint do
  context "should build GeoPoint whith" do
    after :each do
      @gp.to_a.should eql([1, 2])
    end
    it "[lat, lng] array passed" do
      @gp = YaMap::GeoPoint.new [1, 2]
    end
    it "lat, lng args passed" do
      @gp = YaMap::GeoPoint.new 1, 2
    end
    it "{:lat, :lng} hash passed" do
      @gp = YaMap::GeoPoint.new :lat => 1, :lng => 2
    end
    it "object (have 'lat' and 'lng' methods) passed" do
      class A
        def lat;1;end
        def lng;2;end
      end
      @gp = YaMap::GeoPoint.new A.new
    end
  end
  it "should raise error when not valid params passed" do
    lambda{ YaMap::GeoPoint.new "Not valid" }.should raise_error
  end
  it "should return valid js code" do
    gp = YaMap::GeoPoint.new 1, 2
    gp.to_s.should eql('new YMaps.GeoPoint(2,1)')
  end
  it "should return [lat, lng] array" do
    @gp = YaMap::GeoPoint.new [1, 2]
    @gp.to_a.should eql([1,2])
  end
end