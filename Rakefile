require "bundler/gem_tasks"
require 'rake'
require 'rake/testtask'
require 'rspec'
require 'rspec/core/rake_task'

Dir.glob('tasks/*.rake').each { |task| import task }

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
