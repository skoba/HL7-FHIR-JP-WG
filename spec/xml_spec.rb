describe 'FHIR XML examples' do
  let(:fhir_xml_instance) { File.read(MEDICATION0320_XML_EXAMPLE) }
  subject { fhir_xml_instance }

  it { is_expected.to be_valid_xml }

  it { is_expected.to be_valid_fhir_xml }

  specify 'fhir-base.xsd is valid XML' do
    xml_schema = File.open(XML_SCHEMA)
    expect(xml_schema).to be_valid_xml
  end
end
