describe 'FHIR XML examples' do
  subject { MEDICATION0320_XML_EXAMPLE }

  it { is_expected.to be_valid_xml }

  it { is_expected.to be_valid_fhir_xml }

  specify 'fhir-base.xsd is valid XML' do
    xml_schema = File.open(XML_SCHEMA)
    expect(xml_schema).to be_valid_xml
  end
end
