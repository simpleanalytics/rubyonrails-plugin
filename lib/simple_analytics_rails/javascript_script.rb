module SimpleAnalyticsRails
  # This outputs the HTML script with the configuration option added to the <script> tag.
  class JavascriptScript
    def head_html
      [
        sa_event_script,
        script_tag
      ].join
    end

    def body_html
      '<noscript><img src="https://queue.simpleanalyticscdn.com/noscript.gif" alt="" referrerpolicy="no-referrer-when-downgrade" /></noscript>'
    end

    private

    def sa_event_script
      [
        "<script>",
        "window.sa_event=window.sa_event||function(){a=[].slice.call(arguments);sa_event.q?sa_event.q.push(a):sa_event.q=[a]};",
        "</script>"
      ].join
    end

    def script_tag
      [
        "<script",
        configuration_to_html_attributes,
        'async defer src="https://scripts.simpleanalyticscdn.com/latest.js"></script>'
      ].compact
        .reject(&:blank?)
        .join(" ")
    end

    def configuration_to_html_attributes
      SimpleAnalyticsRails.configuration.to_h.collect do |key, value|
        "data-#{key.to_s.tr("_", "-")}=\"#{CGI.escapeHTML(value)}\""
      end.join(" ")
    end
  end
end
