<p align="center">
  <a href="https://simpleanalytics.com/?ref=github.com/simpleanalytics/rubyonrails-plugin">
    <img src="https://assets.simpleanalytics.com/images/logos/logo-github-readme.png" alt="Simple Analytics logo" height="62" />
  </a>
</p>

<p align="center">
  <h1 align="center">Simple Analytics Rails</h1>
  <p align="center">
    <img src="https://img.shields.io/gem/v/simple_analytics_rails.svg?color=red" />
    <a href="https://github.com/simpleanalytics/rubyonrails-plugin/blob/main/LICENSE">
      <img alt="License: MIT" src="https://img.shields.io/badge/license-MIT-brightgreen.svg" target="_blank" />
    </a>
    <a href="https://github.com/testdouble/standard" target="_blank">
      <img alt="Ruby Code Style" src="https://img.shields.io/badge/Ruby_Code_Style-standard-brightgreen.svg" />
    </a>
    <a target="_blank" rel="noopener noreferrer" href="https://github.com/simpleanalytics/rubyonrails-plugin/actions/workflows/standard.yml">
      <img src="https://github.com/simpleanalytics/rubyonrails-plugin/actions/workflows/standard.yml/badge.svg" alt="Standard" style="max-width:100%;">
    </a>
    <a target="_blank" rel="noopener noreferrer" href="https://github.com/simpleanalytics/rubyonrails-plugin/actions/workflows/tests.yml">
      <img src="https://github.com/simpleanalytics/rubyonrails-plugin/actions/workflows/tests.yml/badge.svg" alt="Tests">
    </a>
  </p>
</p>

[Simple Analytics](https://simpleanalytics.com/) is a privacy friendly analytics. No consent required from your visitors!

This gem adds the [JavaScript Tracking Script](https://docs.simpleanalytics.com/script) to the `<head>` tag of your Ruby on Rails applications.

## 🚀 Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_analytics_rails'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install simple_analytics_rails
````

## ✨ Usage

After the gem is installed, it will automatically append the Simple Analytics JavaScript snippet before the `</head>` tag on your HTML pages.

However you can also configure it via an initializer:

```ruby
# config/initializers/simple_analytics.rb
SimpleAnalyticsRails.configure do |configuration|
  # ==> Overwrite domain name
  # https://docs.simpleanalytics.com/overwrite-domain-name
  #
  # Default is ""
  configuration.hostname = "example.com"

  # ==> Hash mode
  # https://docs.simpleanalytics.com/hash-mode
  #
  # Default is ""
  configuration.mode = "hash"

  # ==> Do not track
  # https://docs.simpleanalytics.com/dnt
  #
  # Default is false
  configuration.skip_dnt = false

  # ==> Ignore pages
  # https://docs.simpleanalytics.com/ignore-pages
  #
  # Default is ""
  configuration.ignore_pages = "/search/*,/account/*,/vouchers"

  # ==> Inject JavaScript To Head
  # You can disable the automatic JavaScript injection if you'd like.
  #
  # Default is true
  configuration.inject_javascript_to_head = Rails.env.production?
end
```

## 🙏 Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/simpleanalytics/rubyonrails-plugin .

### Code of Conduct

Everyone interacting in the SimpleAnalyticsRails project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/simpleanalytics/rubyonrails-plugin/blob/main/CODE_OF_CONDUCT.md).

### Coding Standards

This project uses [Standard](https://github.com/testdouble/standard) for Ruby code to minimize bike shedding related to source formatting.

Please run `bundle exec standardrb --fix` prior to submitting pull requests.

## 📦 Releasing

1. Bump version number at `lib/simple_analytics_rails/version.rb`
1. Commit and push changes
1. Publish a new release on GitHub https://github.com/simpleanalytics/rubyonrails-plugin/releases/new
1. A [GitHub Action](https://github.com/simpleanalytics/rubyonrails-plugin/blob/main/.github/workflows/publish.yml) will then publish the latest version to https://rubygems.org/

## 📝 License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Tasks (some doubles)

- [X] - It should be configurable, enabling the user to set the settings which are documented https://docs.simpleanalytics.com/overwrite-domain-name
- It should be available on https://rubygems.org/ - After delivery, I'll run you though how to release new version and such (I'll also documented this in the repo).
- [X] - I'll push my code to https://github.com/simpleanalytics/rubyonrails-plugin
- I've estimated 1 day of development time at £350. I'll invoice you after delivery.
- In future version, we'd like to be able to include more of the tracking options. We'll discuss this after the first version is delivered.
- [X] - Have the CDN version of the script embedded
- [X] - Make the domain customizable in the plugin settings (or the most common way to do this in RoR)
- [X] - Follow the RoR conventions
- [X] Expose the "sa_event" function before the script loads:
    ```
    window.sa_event=window.sa_event||function(){a=[].slice.call(arguments);sa_event.q?sa_event.q.push(a):sa_event.q=[a]};
    ```
- [X] - The script will replace that function when loaded
- [] - Make sure it works well with Turbolinks (some customers experienced double page views when using Turbolinks; they probably had our script in their body of the page).
