# HL7 FHIR JP WG
HL7 FHIR Japan Working groupでの作業のために試行的に作成したリポジトリです。

このリポジトリの内容は個人的な研究・開発によるものであり、日本HL7協会
やHL7 FHIR実装検討ワーキンググループの見解を示すものではありません。

## ファイル構成
````
.
├── .gitignore
├── .travis.yml
├── Gemfile
├── Gemfile.lock
├── LICENSE
├── README.md
├── Rakefile
├── build.md 
├── conf
│   └── redpen-conf.xml
├── docs
│   ├── diag-1aabebb62bfdf0799220655d3c3d71fe.png
│   ├── diag-a664f5dc816ed821388c7fb9ac58b643.png
│   ├── diag-e22a341a294ce7835127abe70971e987.png
│   ├── diag-f6cc03cf6acd716769cfba7e780b36e0.png
│   ├── index.html
├── docs_source
│   ├── hl7fhir-jp.adoc
│   ├── medication.adoc
│   ├── references.adoc
│   ├── terminologies.adoc
├── examples
│   └── swg5_pharma
│       ├── prescription_sample.json
├── index.html
├── schema
│   ├── json
│   └── xml
└── spec
    ├── spec_helper.rb
```

## ライセンス
現時点ではこの文書および構成物のライセンスはApache 2ライセンスを適応し
ますが、将来的にはCC-BY-NDに変更される予定です。ライセンスの内容は
LICENSEを参照してください。

ただし、schema以下のJSON Schema, XML SchemaはHL7 FHIR本体由来ですので
ライセンスはそのCC-0のままとします。
