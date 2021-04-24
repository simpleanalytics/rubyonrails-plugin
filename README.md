<p align="center">
  <a href="https://simpleanalytics.com/?ref=github.com/simpleanalytics/rubyonrails-plugin">
    <img src="https://assets.simpleanalytics.com/images/logos/logo-github-readme.png" alt="Simple Analytics logo" height="62" />
  </a>
</p>

<p align="center">
  <h1 align="center">Simple Analytics Rails</h1>
  <p align="center">
    <a target="_blank" rel="noopener noreferrer" href="https://rubygems.org/gems/simple_analytics_rails">
      <img src="https://img.shields.io/gem/v/simple_analytics_rails.svg?color=red" />
    </a>
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
  configuration.collect_dnt = false

  # ==> Ignore pages
  # https://docs.simpleanalytics.com/ignore-pages
  #
  # Default is ""
  configuration.ignore_pages = "/search/*,/account/*,/vouchers"

  # ==> Override variable used for JavaScript Events
  # https://docs.simpleanalytics.com/events#the-variable-sa_event-is-already-used
  #
  # Default is "sa_event"
  configuration.sa_global = "sa_event"

  # ==> Trigger custom page views
  # https://docs.simpleanalytics.com/trigger-custom-page-views#use-custom-collection-anyway
  #
  # Default is true
  configuration.auto_collect = true

  # ==> Custom Domain
  # https://docs.simpleanalytics.com/bypass-ad-blockers
  #
  # Default is ""
  configuration.custom_domain = "custom.domain.com"

  # ==> Inject JavaScript To Head
  # You can disable the automatic JavaScript injection if you'd like.
  #
  # Default is true
  configuration.enabled = Rails.env.production?
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
