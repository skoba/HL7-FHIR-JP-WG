RSpec::Matchers.define :be_valid_json do
  match do |text|
    begin
      JSON.parse(text)
    rescue JSON::ParserError
      false
    rescue Error
      raise Error
    ensure
      true
    end
  end
end

require 'pathname'
RSpec::Matchers.define :be_valid_fhir_json do
  match do |text|
    json = JSON.parse text
    fhir_json_schema = JSONSchemer.schema(Pathname.new(JSON_SCHEMA))
    fhir_json_schema.valid? json
  end
end
