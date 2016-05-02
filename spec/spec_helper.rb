require 'rake'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rspec_rake'
require 'pry'

RSpecRake.require_tasks(File.expand_path('../tasks', __FILE__))
