describe 'FHIR XML examples' do
  let(:fhir_xml_instance) { File.read(MEDICATION0320_XML_EXAMPLE) }

  specify 'valid XML format' do
    expect(fhir_xml_instance).to be_valid_xml
  end

  specify 'fhir-base.xsd is valid XML' do
    xml_schema = File.open(XML_SCHEMA)
    expect(xml_schema).to be_valid_xml
  end

  specify 'valid to FHIR XML schema' do
    expect(fhir_xml_instance).to be_valid_fhir_xml
  end
end
