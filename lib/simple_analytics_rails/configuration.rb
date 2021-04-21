module SimpleAnalyticsRails
  class Configuration
    def initialize
      @hostname = ""
      @mode = ""
      @ignore_pages = ""
      @collect_dnt = false
      @enabled = true
    end

    attr_accessor :ignore_pages
    attr_accessor :hostname
    attr_accessor :mode
    attr_writer :collect_dnt
    def collect_dnt?
      @collect_dnt
    end

    attr_writer :enabled
    def enabled?
      @enabled
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
