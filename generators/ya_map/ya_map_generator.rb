class YaMapGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.file "ya-map.js", "public/javascripts/ya-map.js"
      m.file "ya-map-api-key.yml", "config/ya-map-api-key.yml"
    end
  end
end