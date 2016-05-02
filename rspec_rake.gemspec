# coding: utf-8
require 'rake'
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec_rake/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec_rake"
  spec.version       = RSpecRake::VERSION
  spec.authors       = ["Izuta Hiroyuki"]
  spec.email         = ["izuta.hiroyuki@gmail.com"]

  spec.summary       = "RSpec settings for Rake task."
  spec.description   = "Makes easier to configure rspec of rake tasks."
  spec.homepage      = "https://github.com/bakunyo/rspec_rake"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rake"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
