RSpec.describe 'FHIR validator matcher' do
  describe 'JSON spec matchers' do
    describe 'Validation for generic JSON format' do
      let(:valid_json) { VALID_JSON }
      specify 'valid json should pass' do
        expect(valid_json).to be_valid_json
      end

      let(:invalid_json) { INVALID_JSON }
      specify 'invalid json should be false' do
        expect(invalid_json).not_to be_valid_json
      end
    end

    describe 'Validation by FHIR JSON schema' do
      let(:valid_fhir_json) { MEDICATION0320_JSON_EXAMPLE }
      specify 'valid FHIR JSON format should be true' do
        expect(valid_fhir_json).to be_valid_fhir_json
      end

      let(:invalid_fhir_json) { VALID_JSON }
      specify 'invalid FHIR JSON format should be false' do
        expect(invalid_fhir_json).not_to be_valid_fhir_json
      end
    end
  end

  describe 'XML spec mathchers' do
    let(:valid_xml) { VALID_XML }

    describe 'Validation for generic XML instance' do
      specify 'valid xml should pass' do
        expect(valid_xml).to be_valid_xml
      end

      let(:invalid_xml) { INVALID_XML }
      specify 'invalid xml should not pass' do
        expect(invalid_xml).not_to be_valid_xml
      end
    end

    describe 'Validation for FHIR XML instance' do
      let(:valid_fhir_xml) { MEDICATION0320_XML_EXAMPLE }
      specify 'valid FHIR instance pass ' do
        expect(valid_fhir_xml).to be_valid_fhir_xml
      end

      let(:invalid_fhir_xml) { VALID_XML }
      specify 'invaild FHIR instance should not pass' do
        expect(invalid_fhir_xml).not_to be_valid_fhir_xml
      end
    end
  end
end
