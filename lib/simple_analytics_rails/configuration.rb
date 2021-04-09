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
        data_hostname: @hostname,
        data_mode: @mode,
        data_skip_dnt: skip_dnt? ? "true" : nil,
        data_ignore_pages: @ignore_pages
      }.compact.reject { |_key, value| value.blank? }
    end
  end
end
