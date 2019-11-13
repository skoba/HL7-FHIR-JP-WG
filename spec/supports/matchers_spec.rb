RSpec.describe 'json validator matcher' do
  let(:valid_json) { '{"name": "FHIR"}' }
  let(:invalid_json) { '{name: FHIR}' }
  let(:valid_fhir_json) { MEDICATION0320_JSON_EXAMPLE }
  let(:invalid_fhir_json) { valid_json }

  context 'Validation for JSON format' do
    specify 'valid json should be true' do
      expect(valid_json).to be_valid_json
    end

    specify 'invalid json should be false' do
      expect(invalid_json).not_to be_valid_json
    end
  end

  context 'Validation for FHIR JSON schema' do
    specify 'valid FHIR JSON format should be true' do
      expect(valid_fhir_json).to be_valid_fhir_json
    end

    specify 'invalid FHIR JSON format should be false' do
      expect(invalid_fhir_json).not_to be_valid_fhir_json
    end
  end
end
