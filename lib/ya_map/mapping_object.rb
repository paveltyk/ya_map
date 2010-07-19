module YaMap
  class MappingObject

    #Transforms a Ruby object into a JavaScript string : String, Array, Hash and general case (using to_s)
    def javascriptify_variable(arg)
      if arg.is_a?(String)
        "\"#{self.escape_javascript(arg)}\""
      elsif arg.is_a?(Array)
        "[" + arg.collect{ |a| self.javascriptify_variable(a)}.join(",") + "]"
      elsif arg.is_a?(Hash)
        "{" + arg.to_a.collect do |v|
          "#{self.javascriptify_method(v[0].to_s)}:#{self.javascriptify_variable(v[1])}"
        end.join(",") + "}"
      elsif arg.nil?
        "undefined"
      else
        arg.to_s
      end
    end

    #Escape string to be used in JavaScript. Lifted from rails.
    def escape_javascript(javascript)
      javascript.gsub(/\r\n|\n|\r/, "\\n").gsub("\"") { |m| "\\#{m}" }
    end

    #Transform a ruby-type method name (like add_overlay) to a JavaScript-style one (like addOverlay).
    def javascriptify_method(method_name)
      method_name.gsub(/_(\w)/){ |s| $1.upcase }
    end

    def binding_name
      self.class.name.split('::').last.underscore + self.object_id.to_s.underscore
    end

    def binding_variable
      "#{Map::JS_OBJECT_MAPPER_NAME}['#{binding_name}']"
    end
  end
end