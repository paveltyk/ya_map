module YaMap
  class ApiKey
    #Read the API key config for the current ENV
    unless File.exist?(RAILS_ROOT + '/config/ya-map-api-key.yml')
      raise "File RAILS_ROOT/config/ya-map-api-key.yml not found"
    else
      env = ENV['RAILS_ENV'] || RAILS_ENV
      YAMAPS_API_KEY = YAML.load_file(RAILS_ROOT + '/config/ya-map-api-key.yml')[env]
    end

    def self.get(options = {})
      if options.has_key?(:key)
        options[:key]
      elsif YAMAPS_API_KEY.is_a?(Hash)
        #For this environment, multiple hosts are possible.
        #:host must have been passed as option
        if options.has_key?(:host)
          YAMAPS_API_KEY[options[:host]]
        else
          raise "Ambiguous YaMaps API Key"
        end
      else
        #Only one possible key: take it and ignore the :host option if it is there
        YAMAPS_API_KEY
      end
    end
  end
end