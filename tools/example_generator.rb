# coding: utf-8
require 'fhir_models'

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

# Mappin HL7 V 2.5 to FHIR 
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

message_header = FHIR::MessageHeader.new(source: {name: 'SEND', endpoint: 'http://fhir-jp/sending'}, destination: {name: 'RECEIVE', endpoint: 'http://fhir-jp/receiving'}, eventCoding: {system: 'http://www.hl7.org', code: 'RDE^O11^RDE_O11'})

patient = FHIR::Patient.new
patient_name = FHIR::HumanName.new(family: "患者",
                           given: "太郎",
                           extension: {
                             url: "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation",
                             valueCode: "IDE"})
patient_kananame = FHIR::HumanName.new(family: "カンジャ",
                           given: "タロウ",
                           extension: {
                             url: "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation",
                             valueCode: "SYL"})
patient.name = [patient_name, patient_kananame]

print message_header.to_json
print patient.to_xml
