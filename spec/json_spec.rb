describe 'FHIR JSON examples' do
  let(:fhir_json_instance) { MEDICATION0320_JSON_EXAMPLE }
  
  specify 'Valid JSON format' do
    expect(fhir_json_instance).to be_valid_json
  end

  specify 'Valid to FHIR JSON scheme' do
    expect(fhir_json_instance).to be_valid_fhir_json
  end
end
