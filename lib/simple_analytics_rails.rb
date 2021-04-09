require_relative "simple_analytics_rails/version"
require_relative "simple_analytics_rails/configuration"
require_relative "simple_analytics_rails/javascript_script"
require_relative "simple_analytics_rails/middleware/javascript_injection"
require_relative "simple_analytics_rails/railtie" if defined?(Rails)

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
