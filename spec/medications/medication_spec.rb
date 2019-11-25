RSpec.describe "Medication Resource Instance" do
  describe 'JSON Instance' do
    MEDICATION_JSON_EXAMPLES.each do |example|
      let(:json) { File.read(example) }

      subject { json }

      it { is_expected.to be_valid_json }

      it { is_expected.to be_valid_fhir_json }
    end
  end

  describe 'XML Instance' do
    MEDICATION_XML_EXAMPLES.each do |example|
      let(:xml) { File.read(example) }

      subject { xml }

      it { is_expected.to be_valid_xml }

      it { is_expected.to be_valid_fhir_xml }
    end
  end
end
