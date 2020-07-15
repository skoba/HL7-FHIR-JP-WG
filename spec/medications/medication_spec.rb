RSpec.describe "Medication Resource Instance" do
  MEDICATION_JSON_EXAMPLES.each do |example|
    describe 'JSON Instance' do
      subject { example }

      it { is_expected.to be_valid_json }

      it { is_expected.to be_valid_fhir_json }
    end
  end

  MEDICATION_XML_EXAMPLES.each do |example|
    describe 'XML Instance' do
      subject { example }

      it { is_expected.to be_valid_xml }

      it { is_expected.to be_valid_fhir_xml }
    end
  end
end
