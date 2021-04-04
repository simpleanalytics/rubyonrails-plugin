module SimpleAnalyticsRails
  class Configuration
    def initialize
      @enabled = true
      @hostname = ""
      @mode = ""
      @skip_dnt = false
      @inject_javascript_to_head = true
    end

    attr_accessor :enabled
    def enabled?
      @enabled
    end

    attr_accessor :hostname
    attr_accessor :mode
    attr_accessor :skip_dnt
    def skip_dnt?
      @skip_dnt
    end

    attr_accessor :inject_javascript_to_head
    def inject_javascript_to_head?
      @inject_javascript_to_head
    end
  end
end
