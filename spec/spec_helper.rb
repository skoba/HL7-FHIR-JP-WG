require 'nokogiri'
require 'json'
require 'json-schema'
require 'json_schemer'
require 'supports/json_matchers'
require 'supports/xml_matchers'

ROOT_PATH = File.expand_path('../', __dir__)
SCHEMA_LOCATION = File.join(ROOT_PATH, 'schema')
SAMPLE_LOCATION = File.join(ROOT_PATH, 'examples')
XML_SCHEMA = File.join(SCHEMA_LOCATION, 'xml', 'fhir-base.xsd')
JSON_SCHEMA = File.join(SCHEMA_LOCATION, 'json', 'fhir.schema.json')

MEDICATION0320_JSON_EXAMPLE = File.join(SAMPLE_LOCATION, 'swg5_pharma', 'medicationexample0320.json')
MEDICATION0320_XML_EXAMPLE = File.join(SAMPLE_LOCATION, 'swg5_pharma', 'medicationexample0320.xml')

