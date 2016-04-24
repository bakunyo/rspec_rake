require 'rake'

module Rake
  class Task
    alias_method :old_invoke, :invoke

    def invoke(*args)
      old_invoke(*args)
      reenable if RSpecRake.auto_reenable
    end
  end
end
