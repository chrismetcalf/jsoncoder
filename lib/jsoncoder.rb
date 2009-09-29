require 'rubygems'
require 'graticule'

class Hash
  def values_at_keys(keys)
    keys.inject([]) { |result, key| result += [self[key]] }
  end
end

class JSONCoder
  def initialize(service, api_key)
     @geocoder = Graticule.service(service).new api_key
  end
  
  def geocode(json, fields)
    begin
      addr = json.values_at_keys(fields).join(", ")
      json.merge!("search_address" => addr)
      
      loc = @geocoder.locate addr
    rescue Exception => e
      # It failed, output an error into the json instead
      return json.merge!("error" => e.message)
    end
    
    # We succeded
    return json.merge!(loc.attributes)
  end
end
