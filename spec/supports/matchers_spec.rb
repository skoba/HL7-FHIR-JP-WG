RSpec.describe 'json validator matcher' do
  specify 'valid json should be true if text is valid json' do
    expect('{"name": "FHIR"}').to be_valid_json
  end
end
