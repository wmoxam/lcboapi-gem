# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "lcboapi/version"

Gem::Specification.new do |s|
  s.name        = "lcboapi"
  s.version     = LcboApi::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Wesley Moxam']
  s.email       = ['wesley@wmoxam.com']
  s.homepage    = "http://github.com/wmoxam/lcboapi"
  s.summary     = %q{A Ruby wrapper for LcboApi's http API}
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
