RSpec.describe "Medication Resource Instance" do
  let(:json) { File.read(File.join(SAMPLE_LOCATION, 'swg5_pharma', 'jp_medication_example_1.json'))}

  specify 'Valid JSON' do
    expect(json).to be_valid_json
  end

  specify 'Valid FHIR JSON format' do
    expect(json).to be_valid_fhir_json
  end
end
