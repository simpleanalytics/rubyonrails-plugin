# frozen_string_literal: true

require_relative "simple_analytics_rails/version"
require_relative "simple_analytics_rails/configuration"
require_relative "simple_analytics_rails/javascript_tracker"
require_relative "simple_analytics_rails/middleware/javascript_injection"
require_relative "simple_analytics_rails/railtie"

module SimpleAnalyticsRails
  class Error < StandardError; end

  # Configuration Object (instance of SimpleAnalyticsRails::Configuration)
  attr_writer :configuration

  class << self
    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def reset_configuration!
      @configuration = nil
    end
  end
end
