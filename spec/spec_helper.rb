require 'nokogiri'
require 'json'
require 'json_schemer'
#require 'json-schema'
require 'supports/json_matchers'
require 'supports/xml_matchers'

ROOT_PATH = File.expand_path('../', __dir__)
SCHEMA_LOCATION = File.join(ROOT_PATH, 'schema')
SAMPLE_LOCATION = File.join(ROOT_PATH, 'examples')
XML_SCHEMA = File.join(SCHEMA_LOCATION, 'xml', 'fhir-base.xsd')
JSON_SCHEMA = File.join(SCHEMA_LOCATION, 'json', 'fhir.schema.json')

MEDICATION_EXAMPLES_LOCATION = File.join(SAMPLE_LOCATION, 'swg5_pharma')
MEDICATION0320_JSON_EXAMPLE = File.join(MEDICATION_EXAMPLES_LOCATION, 'medicationexample0320.json')
MEDICATION0320_XML_EXAMPLE = File.join(MEDICATION_EXAMPLES_LOCATION, 'medicationexample0320.xml')
MEDICATION_JSON_EXAMPLES = Dir.glob(File.join(MEDICATION_EXAMPLES_LOCATION, '*.json'))
MEDICATION_XML_EXAMPLES = Dir.glob(File.join(MEDICATION_EXAMPLES_LOCATION, '*.xml'))
