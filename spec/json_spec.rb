describe 'FHIR JSON examples' do
  let(:fhir_json_instance) { File.read(MEDICATION0320_JSON_EXAMPLE) }

  specify 'Valid JSON format' do
    expect(fhir_json_instance).to be_valid_json
  end

  specify 'fhir.shema.json is valid JSON' do
    json_schema = File.read(JSON_SCHEMA)
    expect(json_schema).to be_valid_json
  end

  specify 'Valid to FHIR JSON schema' do
    expect(fhir_json_instance).to be_valid_fhir_json
  end
end
