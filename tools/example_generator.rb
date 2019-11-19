# coding: utf-8
require 'fhir_models'
#require 'ruby-hl7'

# JAHIS　処方データ交換規約　Ver 3.0Cから
# 1. 内服処方例
# Rp1 　ムコダイン錠２５０ｍｇ １錠 （１日３錠）
#　　　　 パンスポリンＴ錠１００ １００ｍｇ ２錠 （１日６錠）
#  　　　　　１日３回朝昼夕食後 ３日分
# Rp2 　アレピアチン１０％ ５０ｍｇ（１日１００ｍｇ）
# 　　　　 フェノバルビタール散１０％「ホエイ」５０ｍｇ（１日１００ｍｇ）
#  　　　　　１日２回朝夕食後 １４日分
#
# 2. 外用薬
# Rp1　 ジフラール軟膏 ０．０５％ ２本
#　　　　 （塗布薬）１日４回
# 　　　　　　左手
#
# HL7 Version 2.5 message
RP1_HL7_VER25_INSTANCE = <<EOM
MSH|^~\&|SEND||RECEIVE||20160821161523||RDE^O11^RDE_O11|201608211615230143|P|2.5||||||~ISO IR87||ISO 2022-1994
PID|||1000000001^^^^PI||患者^太郎^^^^^L^I~カンジャ^タロウ^^^^^L^P||19601224|M
IN1|1|06^組合管掌健康保険^JHSD0001|""
ORC|NW|12345678||12345678_01|||||20160825|||123456^医師^春子^^^^^^^L^^^^^I~^イシ^ハルコ^^^^^^^L^^^^^P|||||01^内科^99Z01||||||||||||O^外来患者オーダ^HL70482
RXE||103835401^ムコダイン錠２５０ｍｇ^HOT|1||TAB^錠^MR9P|| 01^１回目から服用^JHSP0005|||9|TAB^錠^MR9P||||||||3^TAB&錠&MR9P||OHP^外来処方^MR9P~OHI^院内処方^MR9P||||||21^内服^JHSP0003
TQ1|||1013044400000000&内服・経口・１日３回朝昼夕食後&JAMISDP01|||3^D&日&ISO+|20160825
RXR|PO^口^HL70162
ORC|NW|12345678||12345678_01|||||20160825|||123456^医師^春子^^^^^^^L^^^^^I~^イシ^ハルコ^^^^^^^L^^^^^P|||||01^内科^99Z01||||||||||||O^外来患者オーダ^HL70482
RXE||110626901^パンスポリンＴ錠１００１００ｍｇ^HOT|2||TAB^錠^MR9P|| 01^１回目から服用^JHSP0005|||18|TAB^錠^MR9P||||||||6^TAB&錠&MR9P||OHP^外来処方^MR9P~OHI^院内処方^MR9P||||||21^内服^JHSP0003
TQ1|||1013044400000000&内服・経口・１日３回朝昼夕食後&JAMISDP01|||3^D&日&ISO+|20160825
RXR|PO^口^HL70162
ORC|NW|12345678||12345678_02|||||20160825|||123456^医師^春子^^^^^^^L^^^^^I~^イシ^ハルコ^^^^^^^L^^^^^P|||||01^内科^99Z01||||||||||||O^外来患者オーダ^HL70482
RXE||100607002^アレビアチン散１０％^HOT|50||MG^ミリグラム^MR9P|PWD^散剤^MR9P|01^１回目から服用^JHSP0005|||1.4|G^グラム^MR9P||||||||100^MG&ミリグラム&MR9P||OHP^外来処方^MR9P~OHI^院内処方^MR9P||||100|MG^ミリグラム^MR9P|21^内服^JHSP0003
TQ1|||1012040400000000&内服・経口・１日２回朝夕食後&JAMISDP01|||14^D&日&ISO+|20160825
RXR|PO^口^HL70162
ORC|NW|12345678||12345678_02|||||20160825|||123456^医師^春子^^^^^^^L^^^^^I~^イシ^ハルコ^^^^^^^L^^^^^P|||||01^内科^99Z01||||||||||||O^外来患者オーダ^HL70482
RXE||100565315^フェノバルビタール散１０％「ホエイ」^HOT|50||MG^ミリグラム^MR9P|PWD^散剤^MR9P|01^１回目から服用^JHSP0005|||1.4|G^グラム^MR9P||||||||100^MG&ミリグラム&MR9P||OHP^外来処方^MR9P~OHI^院内処方^MR9P||||100|MG^ミリグラム^MR9P|21^内服^JHSP0003
TQ1|||1012040400000000&内服・経口・１日２回朝夕食後&JAMISDP01|||14^D&日&ISO+|20160825
RXR|PO^口^HL70162
EOM


#v2_message = HL7::Message.new RP1_HL7_VER25_INSTANCE
#print v2_message.inspect

# MSH(Message Header) Mapping HL7 V2.5 to FHIR 
# MSH-1 - none
# MSH-2 - none
# MSH-3 - source.name
# MSH-4 - source.endpoint
# MSH-5 - destination.name
# MSH-6 - destination.endpoint
# MSH-7 - none
# MSH-8 - none
# MSH-9 - eventCoding.code, system: HL7.org
# MSH-10 - * none
# MSH-11 - * none
# MSH-12 - * none
# MSH-13 - none
# MSH-14 - none
# MSH-15 - none
# MSH-16 - none
# MSH-17 - none
# MSH-18 - * none
# MSH-19 - none
# MSH-20 - none
# MSH-21 - none
# ref to https://www.jahis.jp/standard/detail/id=125

message_header = FHIR::MessageHeader.new(
  source: {
    name: 'SEND', #v2_message.sending_app,
    endpoint: 'http://fhir-jp/sending'
  },
  destination: {
    name: 'RECEIVE', #v2_massage.receiving_app,
    endpoint: 'http://fhir-jp/receiving'
  },
  eventCoding: {
    system: 'http://www.hl7.org',
    code: 'RDE^O11^RDE_O11'
  }
)

# PID(Patient Identifier) mapping HL7 V2.5 to FHIR
# PID-1 - none
# PID-2 - none
# PID-3 - identifier[Identifier]
# PID-4 - none
# PID-5 - [HumanName]
# PID-6 - none
# PID-7 - birthDate
# PID-8 - gender
# PID-9 - none
# PID-10 - none
# PID-11 - [Address]
# PID-12 - none
# PID-13 - [Telecom]
# PID-14 - [Telecom]
# PID-15 - communication.language
# PID-16 - marritalStatus
# PID-17 - none
# PID-18 - none
# PID-19 - none
# PID-20 - none
# PID-21 - none
# PID-22 - none
# PID-23 - none
# PID-24 - multipleBirth
# PID-25 - multipleBirth
# PID-26 - none
# PID-27 - none
# PID-28 - none
# PID-29 - deceased
# PID-30 - deceased
# PID-31 - none
# PID-32 - none
# PID-33 - none
# PID-34 - none
# PID-35 - none
# PID-36 - none
# PID-37 - none
# PID-38 - none
# PID-39 - none
# ref to https://www.jahis.jp/standard/detail/id=125


patient_name = FHIR::HumanName.new(
  family: '患者',
  given: '太郎',
  extension: {
    url: 'http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation',
    valueCode: 'IDE'
  }
)
patient_kananame = FHIR::HumanName.new(
  family: 'カンジャ',
  given: 'タロウ',
  extension: {
    url: 'http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation',
    valueCode: 'SYL'
  }
)

patient = FHIR::Patient.new(
  identifier: { value: '1000000001' },
  name: [patient_name, patient_kananame],
  birthDate: '1960-12-24',
  ender: 'male'
)

# IN1(Insurance) Mapping HL7 V2.5 to FHIR
# IN1-1 - none
# IN1-2 - identifier
# IN1-3 - payor
# IN1-4 - (payor)
# IN1-5 - none
# IN1-6 - none
# IN1-7 - none
# IN1-8 - class.value, class.name, costToBeneficiary.value
# IN1-9 - none
# IN1-10 - none
# IN1-11 - none
# IN1-12 - period
# IN1-13 - period
# IN1-14 - none
# IN1-15 - type
# IN1-16 - polycyHolder, subscriber, subscribedId, beneficiary, contract
# IN1-17 - none
# IN1-18 - polycyHolder, subscriber, subscribedId, beneficiary, contract
# IN1-19 - polycyHolder, subscriber, subscribedId, beneficiary, contract
# IN1-20 - none
# IN1-21 - none
# IN1-22 - none
# IN1-23 - none
# IN1-24 - none
# IN1-25 - none
# IN1-26 - none
# IN1-27 - none
# IN1-28 - none
# IN1-29 - none
# IN1-30 - none
# IN1-40 - none
# IN1-41 - none
# IN1-42 - none
# IN1-43 - none
# IN1-44 - none
# IN1-45 - none
# IN1-46 - none
# IN1-47 - none
# IN1-48 - none
# IN1-49 - none
# IN1-50 - none
# IN1-51 - none
# IN1-52 - none
# IN1-53 - none
coverage_organization = FHIR::Organization.new(
  type: { coding: { code: '06', display: '組合管掌健康保険' } },
  identifier: [{ value: 'JHSD0001' }]
)
coverage = FHIR::Coverage.new(
  identifier: [{ value: '1' }],
  payor: coverage_organization
)
# ORC(Common Order) Mapping HL7 V2.5 to FHIR
# ORC-1 - 
# ORC-1 - 
# ORC-1 - 
# ORC-1 - 
# ORC-1 - 
# ORC-1 - 


bundle = FHIR::Bundle.new(type: 'message')
bundle.entry = [message_header, patient]

print bundle.to_xml if bundle.valid?
