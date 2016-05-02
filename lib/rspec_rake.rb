require 'rspec_rake/version'
require_relative 'rake/task'

module RSpecRake
  class << self
    attr_accessor :auto_reenable

    def configure
      yield self

      Rake::Task.define_task(:environment)
    end

    def require_tasks(dir)
      Dir.glob(File.join(dir, '*.rake')).each do |file|
        application.rake_require(File.basename(file).gsub('.rake', ''), [dir])
      end
    end

    private

    def application
      @application ||= Rake::Application.new
    end

    attr_writer :application
  end
end
