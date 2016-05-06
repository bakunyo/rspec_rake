# RspecRake

[![Gem Version](https://badge.fury.io/rb/rspec_rake.svg)](https://badge.fury.io/rb/rspec_rake)
[![Build Status](https://travis-ci.org/bakunyo/rspec_rake.svg?branch=develop)](https://travis-ci.org/bakunyo/rspec_rake)
[![Code Climate](https://codeclimate.com/github/bakunyo/rspec_rake/badges/gpa.svg)](https://codeclimate.com/github/bakunyo/rspec_rake)
[![Test Coverage](https://codeclimate.com/github/bakunyo/rspec_rake/badges/coverage.svg)](https://codeclimate.com/github/bakunyo/rspec_rake/coverage)

## Description
RSpecRake makes easier to configure rspec of rake tasks.

## Installation
```
gem install rspec_rake
```

## Usage
Write configuration for rake tests in your `rails_helper.rb` or `spec_helper.rb`
```ruby
RSpecRake.configure do |config|
  config.require_tasks(File.join('your', 'rake-task', 'dir-path'))
  config.auto_reenable = true # Optinal
end
```

### .auto_reenable is what?
`Rake::Task` can invoke task **only 1 time** because it has `#already_invoked` flag.
But we often want to invoke more in specs.
So if you want to invoke more than 1 time, use `auto_reenable` option.

Be careful your specs doesn't go infinite loop :smiling_imp:

### With Rails
```ruby
# in rails_helper
RSpecRake.configure do |config|
  config.require_tasks(File.join(Rails.root, 'lib', 'tasks')) # or Rails.application.load_tasks
  config.auto_reenable = true # Optinal
end

# in specs, Rake::Task can call everywhere
before  { Rake::Task['some:task'].invoke }
subject { Rake::Task['some:task'].invoke }
after   { Rake::Task['some:task'].invoke }
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bakunyo/rspec_rake.

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

1. Fork it ( http://github.com/bakunyo/rspec_rake/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Released under the MIT License.  See the [LICENSE][] file for further details.

[license]: LICENSE.md
