require_relative "simple_analytics_rails/version"
require_relative "simple_analytics_rails/configuration"
require_relative "simple_analytics_rails/javascript_script"
require_relative "simple_analytics_rails/middleware/javascript_injection"
require_relative "simple_analytics_rails/railtie" if defined?(Rails)

# This will automatically inject the `SimpleAnalyticsRails::Middleware::JavascriptInjection` middleware if you're using Ruby on Rails.
#
# Sample Usage for configuration:
#
#   # config/initializers/simple_analytics.rb
#   SimpleAnalyticsRails.configure do |configuration|
#     configuration.hostname = "example.com"
#     configuration.mode = "hash"
#     configuration.skip_dnt = false
#     configuration.ignore_pages = "/search/*,/account/*,/vouchers"
#     configuration.inject_javascript_to_head = Rails.env.production?
#   end
#
module SimpleAnalyticsRails
  class << self
    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= SimpleAnalyticsRails::Configuration.new
    end

    def reset_configuration!
      @configuration = nil
    end
  end
end
