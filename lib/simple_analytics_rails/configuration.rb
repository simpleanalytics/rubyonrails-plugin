module SimpleAnalyticsRails
  class Configuration
    def initialize
      @hostname = ""
      @mode = ""
      @ignore_pages = ""
      @collect_dnt = false
      @enabled = true
      @custom_domain = ""
      @auto_collect = true
      @sa_global = ""
    end

    attr_accessor :ignore_pages
    attr_accessor :hostname
    attr_accessor :mode
    attr_accessor :sa_global

    attr_writer :collect_dnt
    def collect_dnt?
      @collect_dnt
    end

    attr_writer :enabled
    def enabled?
      @enabled
    end

    attr_writer :custom_domain
    def script_domain
      @custom_domain.present? ? @custom_domain : "scripts.simpleanalyticscdn.com"
    end

    def noscript_domain
      @custom_domain.present? ? @custom_domain : "queue.simpleanalyticscdn.com"
    end

    attr_writer :auto_collect
    def auto_collect?
      @auto_collect
    end

    def to_h
      {
        hostname: @hostname,
        mode: @mode,
        collect_dnt: collect_dnt? ? "true" : nil,
        ignore_pages: @ignore_pages,
        turbolinks_track: turbolinks_track
      }.compact.reject { |_key, value| value.blank? }
    end

    private

    def turbolinks_track
      "reload" if defined?(Turbolinks)
    end
  end
end
