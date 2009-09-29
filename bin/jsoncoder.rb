#!/usr/bin/env ruby
# == Synopsis
#
# jsoncoder: Geocodes addresses contained in JSON input
#
# == Usage
#
# jsoncoder [OPTIONS]
#
# -h, --help:
#    Show help
#
# --fields [field1,field2]
#    The comma-separated list of fields from the JSON that should be concatenated to form a searchable address. Ex:
#       --fields addr1,addr2,city,state,zip
#
# --geocoder [name]:
#    The geocoder to use to geocode the address. For allowed geocoders, see http://graticule.rubyforge.org/
#
# --api-key [key]:
#    Used to specify the API key to use for the geocoder, and overrides the lookup of the key from the key file
# 
# --sleep [seconds]:
#    Tells the script to delay [seconds] seconds between service invocations, to throttle your requests
# 
# --key-file [filename]:
#    The location of a config file containing "geocoder: key" pairs, one on each line. By default, the script looks in "~/.jsoncoder"
#


require 'rubygems'
require 'getoptlong'
require 'rdoc/usage'
require 'json'
require 'yaml'
require File.dirname(__FILE__) + '/../lib/jsoncoder'

opts = GetoptLong.new(
  [ '--help',       '-h', GetoptLong::NO_ARGUMENT ],
  [ '--fields',     '-f', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--geocoder',   '-g', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--api-key',    '-a', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--sleep',      '-s', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--key-file',   '-k', GetoptLong::REQUIRED_ARGUMENT ]
)

fields = Array.new
geocoder = "google"
delay = nil
key_file = "~/.jsoncoder"
api_key = nil
opts.each do |opt, arg|
  case opt
  when '--help'
    RDoc::usage
  when '--fields'
    fields = arg.split(/,/)
  when '--geocoder'
    geocoder = arg
  when '--api-key'
    api_key = arg
  when '--sleep'
    delay = arg.to_i
  when '--key-file'
    key_file = arg
  end
end

# If we didn't get an API key, look it up
if api_key.nil?
  api_key = YAML.load_file(File.expand_path(key_file))[geocoder]
end

geocoder = JSONCoder.new(geocoder, api_key)

ARGF.each_line do |line|
  # Parse the line as JSON and pass it on to our geocoder
  puts geocoder.geocode(JSON.parse(line), fields).to_json
  
  sleep(delay) if !delay.nil?  
end