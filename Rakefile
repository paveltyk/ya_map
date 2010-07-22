require 'rake'
require 'spec/rake/spectask'
require 'rake/rdoctask'

desc 'Default: run specs.'
task :default => :spec

desc 'Run the specs'
Spec::Rake::SpecTask.new(:spec) do |t|
  t.libs << 'lib'
  t.spec_opts = ['--colour --format nested --loadby mtime --reverse']
  t.spec_files = FileList['spec/**/*_spec.rb']
end

desc 'Generate documentation for the ya_map plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Ya-map'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
