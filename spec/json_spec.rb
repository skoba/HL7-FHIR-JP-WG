describe 'FHIR JSON examples' do
  let(:fhir_json_instance) { '{"name": "fhir"}' }
  
  specify 'Valid JSON format' do
    expect(fhir_json_instance).to be_valid_json
  end
end
