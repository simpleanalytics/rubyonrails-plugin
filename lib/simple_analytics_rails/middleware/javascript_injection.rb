module SimpleAnalyticsRails::Middleware
  # This receives the request payload and injects the JavaScript snippet to the HTML.
  # It's injected just before the </head> element.
  class JavascriptInjection
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)

      if headers && headers["Content-Type"]&.include?("text/html")
        response = inject_javascript_to_response(response)
      end

      [status, headers, response]
    end

    private

    def inject_javascript_to_response(response)
      if SimpleAnalyticsRails.configuration.enabled? && response.respond_to?("[]")
        response[0]&.gsub!("</head>", "#{javascript_script.head_html}</head>")
        response[0]&.gsub!("</body>", "#{javascript_script.body_html}</body>")
      end

      response
    end

    def javascript_script
      @javascript_script ||= SimpleAnalyticsRails::JavascriptScript.new
    end
  end
end
