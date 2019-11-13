RSpec.describe 'FHIR validator matcher' do
  describe 'JSON spec matchers' do
    let(:valid_json) { '{"name": "FHIR"}' }
    let(:invalid_json) { '{name: FHIR}' }
    let(:valid_fhir_json) { File.read(MEDICATION0320_JSON_EXAMPLE) }
    let(:invalid_fhir_json) { valid_json }

    describe 'Validation for generic JSON format' do
      specify 'valid json should pass' do
        expect(valid_json).to be_valid_json
      end

      specify 'invalid json should be false' do
        expect(invalid_json).not_to be_valid_json
      end
    end

    describe 'Validation by FHIR JSON schema' do
      specify 'valid FHIR JSON format should be true' do
        expect(valid_fhir_json).to be_valid_fhir_json
      end

      specify 'invalid FHIR JSON format should be false' do
        expect(invalid_fhir_json).not_to be_valid_fhir_json
      end
    end
  end

  describe 'XML spec mathchers' do
    let(:valid_xml) { '<xml></xml>' }
    let(:invalid_xml) { '<xml></html>' }
    let(:valid_fhir_xml) { File.read(MEDICATION0320_XML_EXAMPLE) }
    let(:invalid_fhir_xml) { valid_xml }

    describe 'Validation for generic XML instance' do
      specify 'valid xml should pass' do
        expect(valid_xml).to be_valid_xml
      end

      specify 'invalid xml should not pass' do
        expect(invalid_xml).not_to be_valid_xml
      end
    end

    describe 'Validation for FHIR XML instance' do
      specify 'valid FHIR instance pass ' do
        expect(valid_fhir_xml).to be_valid_fhir_xml
      end

      specify 'invaild FHIR instance should not pass' do
        expect(invalid_fhir_xml).not_to be_valid_fhir_xml
      end
    end
  end
end
