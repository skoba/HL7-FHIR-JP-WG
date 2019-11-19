describe 'FHIR JSON examples' do
  let(:fhir_json_instance) { File.read(MEDICATION0320_JSON_EXAMPLE) }
  subject { fhir_json_instance }

  it { is_expected.to be_valid_json }

  specify 'fhir.shema.json is also a valid JSON' do
    json_schema = File.read(JSON_SCHEMA)
    expect(json_schema).to be_valid_json
  end

  it { is_expected.to be_valid_fhir_json }
end
