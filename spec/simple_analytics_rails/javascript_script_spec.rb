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
        expect(javascript_script.head_html).to include('<script data-hostname="example.com" data-mode="hash" data-collect-dnt="true" async defer src="https://scripts.simpleanalyticscdn.com/latest.js"></script>')
      end
    end
  end

  describe "#body_html" do
    it do
      expect(javascript_script.body_html).to eq('<noscript><img src="https://queue.simpleanalyticscdn.com/noscript.gif" alt="" referrerpolicy="no-referrer-when-downgrade" /></noscript>')
    end
  end
end
