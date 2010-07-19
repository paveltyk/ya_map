module YaMap
  class GeoPoint
    attr_accessor :lat
    attr_accessor :lng
    # GeoPoint.new(lat, lng)
    def initialize *args
      if args[0].is_a?(Array)
        @lat, @lng = args[0][0..1]
      elsif args.size == 2
        @lat, @lng = args[0..1]
      elsif args[0].is_a?(Hash)
        @lat = args[0][:lat]
        @lng = args[0][:lng]
      elsif args[0].respond_to?(:lat) && args[0].respond_to?(:lng)
        @lat = args[0].lat
        @lng = args[0].lng
      else
        raise "Invalid args passed. Could not initialize GeoPoint."
      end
    end
    def to_s mode = :new
      case mode
        when :new: "new YMaps.GeoPoint(#{@lng},#{@lat})"
      end
    end
    def to_a
      [lat, lng]
    end
  end
end