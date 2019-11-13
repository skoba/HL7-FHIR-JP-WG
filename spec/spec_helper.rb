require 'nokogiri'
require 'json'
require 'json_schemer'
require 'supports/json_matchers'
#require "rspec/json_expectations"
#require 'rspec/json_matcher'

ROOT_PATH = File.expand_path('../', __dir__)
SCHEMA_LOCATION = File.join(ROOT_PATH, 'schema')
SAMPLE_LOCATION = File.join(ROOT_PATH, 'examples')
XML_SCHEMA = File.join(SCHEMA_LOCATION, 'xml', 'xml.xsd')
JSON_SCHEMA = File.join(SCHEMA_LOCATION, 'json', 'fhir.schema.json')

MEDICATION0320_JSON_EXAMPLE = File.read(File.join(SAMPLE_LOCATION, 'swg5_pharma', 'medicationexample0320.json'))
#RSpec.configuration.include RSpec::JsonMatcher
