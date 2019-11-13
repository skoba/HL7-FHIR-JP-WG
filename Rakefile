require "rspec/core/rake_task"

base_dir = File.join(File.dirname(__FILE__))
doc_dir = File.join(base_dir, 'docs')
html_dir = doc_dir # File.join(doc_dir, 'html')
adoc_dir = File.join(base_dir, 'docs_source')
conf_dir = File.join(base_dir, 'conf')
RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :html do
  main_adoc = File.join(adoc_dir, 'hl7fhir-jp.adoc')
  sh "asciidoctor -r asciidoctor-diagram -B #{adoc_dir} -D #{html_dir} #{main_adoc} -o index.html"
end

task :redpen do
  adoc_files = Dir.glob("#{adoc_dir}/*.adoc").join(" ")
  sh "redpen -l 3 -c#{conf_dir}/redpen-conf.xml -f asciidoc #{adoc_files}"
end
