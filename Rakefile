require 'bundler'
Bundler::GemHelper.install_tasks
require 'spec/rake/spectask'

desc 'generate tests'
task :generate_tests do
  require 'erb'
  puts 'Not yet implemented.'
end

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/*.rb']
end

