require 'bundler'
Bundler::GemHelper.install_tasks
require 'spec/rake/spectask'

desc 'watch coffeescript'
task :watch_coffee do
  sh 'coffee --watch -c js/spec/*.coffee js/lib/*.coffee'
end

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/*.rb']
end

