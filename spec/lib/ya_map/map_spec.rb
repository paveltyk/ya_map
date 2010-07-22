require 'spec_helper'

describe YaMap::Map do
  it "should generate valid header block" do
    YaMap::ApiKey.should_receive(:get).and_return('ApiKey')
    YaMap::Map.header.should eql('<script src="http://api-maps.yandex.ru/1.1/index.xml?key=ApiKey" type="text/javascript"></script><script src="/javascripts/ya-map.js" type="text/javascript"></script>')
  end
  let(:map) {YaMap::Map.new 'map'}
  describe 'control_init method' do
    it "should build default controls" do
      map.instance_variable_get(:@init_start).should eql([])
    end
    it "should include zoom control initialization js" do
      map.control_init(:zoom => true).should eql(["map.addControl(new YMaps.Zoom());"])
    end
  end

  it "should set map center point using array and zoom" do
    map.center_zoom_init([1,2],5).should eql(["map.setCenter(new YMaps.GeoPoint(2,1),5);"])
  end
  it "should set map center point using GeoPoint and no zoom" do
    map.center_zoom_init(YaMap::GeoPoint.new(1,2)).should eql(["map.setCenter(new YMaps.GeoPoint(2,1),#{YaMap::Map::DEFAULT_ZOOM});"])
  end
  it "should return addOverlay js method" do
    map.add_overlay("Some JS").should eql(["map.addOverlay(Some JS);"])
  end
  it "should enable scroll zoom" do
    map = YaMap::Map.new 'map', :enable_scroll_zoom => true
    map.to_html.should =~ /map.enableScrollZoom\(\);/
  end
  it "should set map min zoom" do
    map.should_receive(:record_init).with('map.setMinZoom(10);')
    map.set_min_zoom 10
  end
  it "should set map max zoom" do
    map.should_receive(:record_init).with('map.setMaxZoom(10);')
    map.set_max_zoom 10
  end
end
