require_relative '../sample'

namespace :sample do
  desc 'call Sample#hello'
  task hello: :environment do
    Sample.hello
  end
end
