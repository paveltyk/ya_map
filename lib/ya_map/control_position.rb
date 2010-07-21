module YaMap
  class ControlPosition
    TOP_LEFT = 'YMaps.ControlPosition.TOP_LEFT'
    TOP_RIGHT = 'YMaps.ControlPosition.TOP_RIGHT'
    BOTTOM_LEFT = 'YMaps.ControlPosition.BOTTOM_LEFT'
    BOTTOM_RIGHT = 'YMaps.ControlPosition.BOTTOM_RIGHT'
    # ControlPosition.new ControlPosition::TOP_LEFT, :x => 10, :y => 10
    def initialize pos, offset = {}
      @ancor = pos
      @off = offset.reverse_merge :x => 5, :y => 5
    end
    def to_s mode = :new
      case mode
        when :new: "new YMaps.ControlPosition(#{@ancor}, new YMaps.Point(#{@off[:x]},#{@off[:y]}))"
      end
    end
  end
end