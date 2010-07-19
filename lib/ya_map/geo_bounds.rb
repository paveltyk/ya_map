module YaMap
  class GeoBounds
    attr_accessor :sw, :ne
    def initialize sw, ne
      @sw = sw
      @ne = ne
    end
    # Build new GeoBounds object from any object that responds to :sw and :ne messages,
    # for example GeoKit::Bounds object.
    def self.build bounds
      self.new GeoPoint.new(bounds.sw), GeoPoint.new(bounds.ne)
    end
    def to_s mode = :new
      case mode
        when :new: "new YMaps.GeoBounds(#{@sw},#{@ne})"
      end
    end
  end
end