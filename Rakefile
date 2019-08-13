require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :html do
  base_dir = File.join(File.dirname(__FILE__), 'doc/')
  html_dir = File.join(base_dir, 'html')
  adoc_dir = File.join(base_dir, 'asciidoc')
  adoc = File.join(adoc_dir, 'hl7fhir-jp.adoc')
  sh "asciidoctor -r asciidoctor-diagram -B #{adoc_dir} -D #{html_dir} #{adoc}"
end
