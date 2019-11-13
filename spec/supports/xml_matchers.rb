RSpec::Matchers.define :be_valid_xml do
  match do |text|
    begin
      Nokogiri::XML(text) { |config| config.strict}
      true
    rescue Nokogiri::XML::SyntaxError
      false
    rescue Error => e
      print e
      false
    end
  end
end

RSpec::Matchers.define :be_valid_fhir_xml do
  match do |text|
    schema = Nokogiri::XML::Schema(File.open(XML_SCHEMA))
    schema.valid? Nokogiri::XML(text)
  end
end
