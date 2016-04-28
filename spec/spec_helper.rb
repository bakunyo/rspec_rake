require 'rake'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rspec_rake'
require 'pry'

task_dir = File.expand_path('../tasks', __FILE__)
RSpecRake.require_tasks(task_dir)
