RSpec::Matchers.define :be_valid_json do
  match do |text|
    begin
      JSON.parse(text)
      true
    rescue JSON::ParserError
      false
    end
  end
end

require 'pathname'
RSpec::Matchers.define :be_valid_fhir_json do
  match do |text|
    fhir_json_schema = JSONSchemer.schema(Pathname.new(JSON_SCHEMA))
    fhir_json_schema.valid?(JSON.parse(text))
  end
end
