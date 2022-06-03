RSpec::Matchers.define :be_valid_json do
  match do |text|
    begin
      JSON.parse(File.read(text))
      true
    rescue JSON::ParserError
      false
    end
  end
end

require 'pathname'
RSpec::Matchers.define :be_valid_fhir_json do
  match do |text|
    ## The following implementation spells large number of bug reports,
    ## because JSON Schema of HL7 FHIR is so big. You may try this, if
    ## If you are suffered from error of JSON schema
    # 
    fhir_json_schema = JSONSchemer.schema(Pathname.new(JSON_SCHEMA))
    # errors = fhir_json_schema.validate(JSON.parse(File.read(text))).to_a
    # if errors.empty?
    #   true
    # else
    #   errors.each do |error|
    #     puts error
    #   end
    #   false
    # end
    fhir_json_schema.valid?(JSON.parse(File.read(text)))
  end
end
