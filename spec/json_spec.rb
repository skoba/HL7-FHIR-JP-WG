describe 'FHIR JSON examples' do
  subject { MEDICATION0320_JSON_EXAMPLE }

  it { is_expected.to be_valid_json }

  specify 'fhir.shema.json is also a valid JSON' do
    expect(JSON_SCHEMA).to be_valid_json
  end

  it { is_expected.to be_valid_fhir_json }
end
