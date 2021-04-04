module SimpleAnalyticsRails
  class JavascriptTracker
    def initialize
    end

    def frontend_script
      [
        '<script async defer src="https://scripts.simpleanalyticscdn.com/latest.js"></script>',
        '<noscript><img src="https://queue.simpleanalyticscdn.com/noscript.gif" alt="" referrerpolicy="no-referrer-when-downgrade" /></noscript>'
      ].join
    end
  end
end
