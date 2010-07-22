module YaMap
  class ApiKey
    #Read the API key config for the current ENV
    def self.get(options = {})
      api_key = YAML.load_file(RAILS_ROOT + '/config/ya-map-api-key.yml')[RAILS_ENV]
      if options.has_key?(:key)
        options[:key]
      elsif api_key.is_a?(Hash)
        #For this environment, multiple hosts are possible.
        #:host must have been passed as option
        if options.has_key?(:host)
          api_key[options[:host]]
        else
          raise "Ambiguous YaMaps API Key"
        end
      else
        #Only one possible key: take it and ignore the :host option if it is there
        api_key
      end
    end
  end
end
