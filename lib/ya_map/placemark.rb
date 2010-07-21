module YaMap
  class Placemark < YaMap::MappingObject
    attr_accessor :options, :extras
    # geo_point - GeoPoint.new(lat, lng)
    # extras - hash. :icon_content => 'Icon Content!', :name => 'Balloon Name', :description => 'Balloon Description'
    def initialize geo_point, options = {}, extras = {}
      @geo_point = geo_point.is_a?(YaMap::GeoPoint) ? geo_point : YaMap::GeoPoint.new(geo_point)
      @options = options
      @extras = extras
    end
    def to_s mode = :new
      case mode
        when :new: "buildPlacemark('#{binding_name}', #{@geo_point}, #{javascriptify_variable(@options)}, #{javascriptify_variable(@extras)})"
      end
    end
  end
end