# 文書作成環境

このプロジェクトではAsciiDoc形式で文書を作成しています。Asciidoc形式は
markdown類似の文法で習得しやすく、HTML形式だけではなくePubやPDFなどの
様々なフォーマットにも対応し、電子出版で広く使われています。

AsciiDoc形式をベースとして、PlantUMLを図表作成ツールとして利用していま
す。書かれた文章が技術的文書として適正かどうかのをRedpenで行っています。以下に使用しているソフトウェア、パッケージを示します。

* Ruby (2.6.0)
 * Rake (12.3.3)
 * asciidoctor (2.0.10)
 * asciidoctor-diagram (1.5.18)
* OpenJDK (1.8.0_222)
 * PlantUML 1.2017.15
 * Redpen 1.10.1
 
 AsciiDoc形式の文書は doc/asciidoc 以下に配置します。htmlへの変換は rake で自動化しており、 doc/html 以下に以下のコマンドで生成されます。。
 ```
 # rake html
 ```

