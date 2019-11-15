RSpec.describe "Medication Resource Instance" do
  describe 'JSON Instance' do
    let(:json) { File.read(File.join(SAMPLE_LOCATION, 'swg5_pharma', 'jp_medication_example_1.json'))}

    subject { json }

    it { is_expected.to be_valid_json }

    it { is_expected.to be_valid_fhir_json }
  end

  describe 'XML Instance' do
    let(:xml) { File.read(File.join(SAMPLE_LOCATION, 'swg5_pharma', 'jp_medication_example_1.xml')) }

    subject { xml }

    it { is_expected.to be_valid_xml }

    it { is_expected.to be_valid_fhir_xml }
  end
end
