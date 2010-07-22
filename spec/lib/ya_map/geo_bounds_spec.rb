#require 'spec_helper'
require File.dirname(__FILE__) + '/../../spec_helper.rb'

describe YaMap::GeoBounds do
  it "should return valid JS" do
    sw = YaMap::GeoPoint.new 1,2
    ne = YaMap::GeoPoint.new 3,4
    gb = YaMap::GeoBounds.new sw, ne
    gb.to_s.should eql("new YMaps.GeoBounds(#{sw},#{ne})")
  end
  it "should build object from and object that responds to :sw and :ne messages" do
    class SomeBounds
      def sw; YaMap::GeoPoint.new 1,2;end
      def ne; YaMap::GeoPoint.new 3,4;end
    end
    gb = YaMap::GeoBounds.build SomeBounds.new
    gb.to_s.should eql("new YMaps.GeoBounds(#{YaMap::GeoPoint.new 1,2},#{YaMap::GeoPoint.new 3,4})")
  end

end
