require 'nokogiri'
require 'json'
require 'json-schema'
require 'supports/json_matchers'
#require "rspec/json_expectations"
#require 'rspec/json_matcher'

ROOT_PATH = File.expand_path(__dir__) #'../', __FILE__)
SCHEMA_LOCATION = File.join(ROOT_PATH, 'schema')
SAMPLE_LOCATION = File.join(ROOT_PATH, 'example')
XML_SCHEMA = File.join(SCHEMA_LOCATION, 'xml', 'xml.xsd')
JSON_SCHEMA = File.join(SCHEMA_LOCATION, 'json', 'fhir.schema.json')

#RSpec.configuration.include RSpec::JsonMatcher
