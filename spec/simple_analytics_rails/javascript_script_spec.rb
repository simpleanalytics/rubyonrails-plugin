RSpec.describe SimpleAnalyticsRails::JavascriptScript do
  let(:javascript_script) { described_class.new }

  describe "#head_html" do
    it do
      expect(javascript_script.head_html).to include("<script>window.sa_event=window.sa_event||function(){a=[].slice.call(arguments);sa_event.q?sa_event.q.push(a):sa_event.q=[a]};</script>")
        .and include('<script async defer src="https://scripts.simpleanalyticscdn.com/latest.js"></script>')
    end

    context "with configuration set" do
      before do
        SimpleAnalyticsRails.configure do |configuration|
          configuration.hostname = "example.com"
          configuration.mode = "hash"
          configuration.collect_dnt = true
        end
      end

      it do
        expect(javascript_script.head_html).to include('window.sa_event=window.sa_event||function()')
        expect(javascript_script.head_html).to include('<script data-hostname="example.com" data-mode="hash" data-collect-dnt="true" async defer src="https://scripts.simpleanalyticscdn.com/latest.js"></script>')
      end
    end

    context "with configuration.sa_global set to pa_event" do
      before do
        SimpleAnalyticsRails.configure do |configuration|
          configuration.sa_global = "pa_event"
        end
      end

      it do
        expect(javascript_script.head_html).to include('window.pa_event=window.pa_event||function()')
        expect(javascript_script.head_html).to include('<script data-sa-global="pa_event" async defer src="https://scripts.simpleanalyticscdn.com/latest.js"></script>')
      end
    end

    context "with configuration.auto_collect set to false" do
      before do
        SimpleAnalyticsRails.configure do |configuration|
          configuration.auto_collect = false
        end
      end

      it do
        expect(javascript_script.head_html).to include('<script data-auto-collect="false" async defer src="https://scripts.simpleanalyticscdn.com/latest.js"></script>')
      end
    end

    context "with configuration.custom_domain set to custom.domain.com" do
      before do
        SimpleAnalyticsRails.configure do |configuration|
          configuration.custom_domain = "custom.domain.com"
        end
      end

      it do
        expect(javascript_script.head_html).to include('<script async defer src="https://custom.domain.com/latest.js"></script>')
      end
    end
  end

  describe "#body_html" do
    it do
      expect(javascript_script.body_html).to eq('<noscript><img src="https://queue.simpleanalyticscdn.com/noscript.gif" alt="" referrerpolicy="no-referrer-when-downgrade" /></noscript>')
    end

    context "with configuration.custom_domain set to custom.domain.com" do
      before do
        SimpleAnalyticsRails.configure do |configuration|
          configuration.custom_domain = "custom.domain.com"
        end
      end

      it do
        expect(javascript_script.body_html).to include('<img src="https://custom.domain.com/noscript.gif"')
      end
    end
  end
end
