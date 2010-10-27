# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'protopatch/version'

Gem::Specification.new do |s|
  s.name        = "protopatch"
  s.version     = ProtoPatch::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = []
  s.email       = []
  s.homepage    = "http://rubygems.org/gems/protopatch"
  s.summary     = "TODO: Write a gem summary"
  s.description = "TODO: Write a gem description"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "protopatch"

  s.add_development_dependency "bundler", ">= 1.0.0.rc.5"
  s.add_development_dependency "rspec", ">= 1.3.0"
  s.add_development_dependency "rake", ">= 0.8.7"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").select{|f| f =~ /^bin/}
  s.require_path = 'lib'
end
