require 'json'

RSpec::Matchers.define :be_valid_json do
  match do |text|
    begin
      JSON.parse(text)
    rescue JSON::ParserError
      false
    ensure
      true
    end
  end
end
