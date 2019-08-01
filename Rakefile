require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :html do
  base_dir = File.join(File.dirname(__FILE__), 'doc/')
  html_dir = File.join(base_dir, 'html')
  adoc = File.join(base_dir, 'hl7fhir-jp.adoc')
  sh "asciidoctor -B #{base_dir} -D #{html_dir} #{adoc}"
end
