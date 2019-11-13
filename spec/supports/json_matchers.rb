RSpec::Matchers.define :be_valid_json do
  match do |text|
    begin
      JSON.parse(text)
    rescue JSON::ParserError
      print 'invalid json format'
      false
    rescue Error
      puts 'other error'
      raise Error
    ensure
      true
    end
  end
end

RSpec::Matchers.define :be_valid_fhir_json do
  match do |text|
    fhir_json_shema = JSONSchemer.schema(JSON_SCHEMA)
    fhir_json_shema.valid? text
  end
end
