RSpec.describe "Medication Resource Instance" do
  describe 'JSON Instance' do
    let(:json) { File.read(File.join(SAMPLE_LOCATION, 'swg5_pharma', 'jp_medication_example_1.json'))}

    example 'Valid JSON' do
      expect(json).to be_valid_json
    end
    
    example 'Valid FHIR JSON format' do
      expect(json).to be_valid_fhir_json
    end
  end

  describe 'XML Instance' do
    let(:xml) { File.read(File.join(SAMPLE_LOCATION, 'swg5_pharma', 'jp_medication_example_1.xml')) }
    
    example 'Valid XML' do
      expect(xml).to be_valid_xml
    end

    example 'Valid FHIR XML' do
      expect(xml).to be_valid_fhir_xml
    end
  end
end
