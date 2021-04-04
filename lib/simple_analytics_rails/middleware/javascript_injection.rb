module SimpleAnalyticsRails::Middleware
  class JavascriptInjection
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)

      if headers["Content-Type"]&.include?("text/html")
        response = inject_javascript_to_response(response)
      end

      [status, headers, response]
    end

    private

    def inject_javascript_to_response(response)
      if SimpleAnalyticsRails.configuration.inject_javascript_to_head? && response.respond_to?("[]")
        response[0].gsub!("</head>", "#{javascript_tracker.frontend_script}</head>")
      end

      response
    end

    def javascript_tracker
      @javascript_tracker ||= SimpleAnalyticsRails::JavascriptTracker.new
    end
  end
end
