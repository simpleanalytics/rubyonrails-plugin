RSpec.describe SimpleAnalyticsRails::Configuration do
  let(:configuration) { described_class.new }

  describe "#enabled=" do
    it do
      expect { configuration.enabled = false }
        .to change(configuration, :enabled?).from(true).to(false)
    end
  end

  describe "#inject_javascript_to_head=" do
    it do
      expect { configuration.inject_javascript_to_head = false }
        .to change(configuration, :inject_javascript_to_head?).from(true).to(false)
    end
  end

  describe "#skip_dnt=" do
    it do
      expect { configuration.skip_dnt = true }
        .to change(configuration, :skip_dnt?).from(false).to(true)
    end
  end

  describe "#to_html_attributes" do
    context "with default settings" do
      it do
        expect(configuration.to_html_attributes).to eq("")
      end
    end

    context "with hostname, ignore_pages & mode set" do
      before do
        configuration.hostname = "example.com"
        configuration.skip_dnt = true
        configuration.ignore_pages = "/vouchers"
      end

      it do
        expect(configuration.to_html_attributes).to include(' data-hostname="example.com" ')
        expect(configuration.to_html_attributes).to include(' data-skip-dnt="true" ')
        expect(configuration.to_html_attributes).to include(' data-ignore-pages="/vouchers" ')
      end
    end
  end
end
