require 'rake'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rspec_rake'
require 'pry'

Rake.application = Rake::Application.new
task_path = File.expand_path('../tasks', __FILE__)
Rake.application.rake_require('sample', [task_path])
Rake::Task.define_task(:environment)
