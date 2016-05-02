$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rspec_rake'

RSpecRake.configure do |config|
  config.require_tasks(File.expand_path('../tasks', __FILE__))
end
