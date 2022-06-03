RSpec::Matchers.define :be_valid_xml do
  match do |text|
    begin
      Nokogiri::XML(File.open(text)) { |config| config.strict }
      true
    rescue Nokogiri::XML::SyntaxError => se
      print se
      false
    rescue Error => e
      print e
      false
    end
  end
end

RSpec::Matchers.define :be_valid_fhir_xml do
  match do |text|
    doc = File.open(text) { |f| Nokogiri::XML(f) }
    schema = Nokogiri::XML::Schema(File.open(XML_SCHEMA))
    errors = schema.validate doc
    if errors.empty?
      true
    else
      puts text
      errors.each do |error|
        puts error.message
      end
      false
    end
  end
end
