RSpec.describe "Medication Resource Instance" do
  MEDICATION_JSON_EXAMPLES.each do |example|
    describe 'JSON Instance' do
      let(:json) { File.read(example) }
      
      subject { json }

      it { is_expected.to be_valid_json }

      it { is_expected.to be_valid_fhir_json }
    end
  end

  MEDICATION_XML_EXAMPLES.each do |example|
    describe 'XML Instance' do
      let(:xml) { puts example; File.read(example) }

      subject { xml }

      it { is_expected.to be_valid_xml }

      it { is_expected.to be_valid_fhir_xml }
    end
  end
end
