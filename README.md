# SimpleAnalytics - Rails

## Tasks (some doubles)

- It should be configurable, enabling the user to set the settings which are documented https://docs.simpleanalytics.com/overwrite-domain-name
- It should be available on https://rubygems.org/ - After delivery, I'll run you though how to release new version and such (I'll also documented this in the repo).
- I'll push my code to https://github.com/simpleanalytics/rubyonrails-plugin
- I've estimated 1 day of development time at £350. I'll invoice you after delivery.
- In future version, we'd like to be able to include more of the tracking options. We'll discuss this after the first version is delivered.
- Have the CDN version of the script embedded
- Make the domain customizable in the plugin settings (or the most common way to do this in RoR)
- Follow the RoR conventions
- Expose the "sa_event" function before the script loads:
    ```
    window.sa_event=window.sa_event||function(){a=[].slice.call(arguments);sa_event.q?sa_event.q.push(a):sa_event.q=[a]};
    ```
- The script will replace that function when loaded
- Make sure it works well with Turbolinks (some customers experienced double page views when using Turbolinks; they probably had our script in their body of the page).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_analytics_rails'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install simple_analytics_rails

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/simple_analytics_rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/simple_analytics_rails/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SimpleAnalyticsRails project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/simple_analytics_rails/blob/master/CODE_OF_CONDUCT.md).
