module SimpleAnalyticsRails
  class Configuration
    def initialize
      @enabled = true
      @hostname = ""
      @mode = ""
      @ignore_pages = ""
      @skip_dnt = false
      @inject_javascript_to_head = true
    end

    attr_writer :enabled
    def enabled?
      @enabled
    end

    attr_accessor :ignore_pages
    attr_accessor :hostname
    attr_accessor :mode
    attr_writer :skip_dnt
    def skip_dnt?
      @skip_dnt
    end

    attr_writer :inject_javascript_to_head
    def inject_javascript_to_head?
      @inject_javascript_to_head
    end

    def to_h
      {
        hostname: @hostname,
        mode: @mode,
        skip_dnt: skip_dnt? ? "true" : nil,
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
