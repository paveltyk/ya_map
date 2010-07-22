require 'spec_helper'

describe YaMap::Placemark do
  it "should return valid js" do
    pm = YaMap::Placemark.new YaMap::GeoPoint.new(1,2)
    pm.to_s.should match(/^buildPlacemark\('placemark_(\d*)', new YMaps.GeoPoint\(2,1\), \{\}, \{\}\)$/i)
  end
end
