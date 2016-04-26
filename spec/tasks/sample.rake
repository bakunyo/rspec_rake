require_relative '../sample'

namespace :sample do
  desc 'call Sample.method_a'
  task method_a: :environment do
    Sample.method_a
  end

  desc 'call Sample.method_b'
  task method_b: :environment do
    Sample.method_b
  end
end
