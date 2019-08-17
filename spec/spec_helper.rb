require 'nokogiri'
require 'json-schema'

ROOT_PATH = File.expand_path('../', __FILE__)
SCHEMA_LOCATION = File.join(ROOT_PATH, 'schema')
SAMPLE_LOCATION = File.join(ROOT_PATH, 'example')
XML_SCHEMA = File.join(SCHEMA_LOCATION, 'xml', 'xml.xsd')
JSON_SCHEMA = File.join(SCHEMA_LOCATION, 'json', 'fhir.schema.json')
