require 'rspec_rake/version'
require_relative 'rake/task'

module RSpecRake
  class << self
    attr_accessor :auto_reenable
  end
end
