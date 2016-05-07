require 'rake'
require 'rspec_rake/version'
require 'rspec_rake/rake/task'

module RSpecRake
  class << self
    # Flag for method hook.  
    # If true, call Rake::Task#reenable after Rake::Task#invoke
    attr_accessor :auto_reenable

    # This method exists only to clarify that these are RSpecRake configurations.
    # @yield [self] yield RSpecRake module instance.
    # @example
    #   RSpecRake.configure do |config|
    #     config.require_tasks('rake_dir')
    #     config.auto_reenable = true
    #   end
    def configure
      yield self

      Rake::Task.define_task(:environment)
    end

    # To define rake tasks, put your rake directory path
    # @param [String] dir Directory path of rake files 
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
