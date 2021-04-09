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

  describe "#to_h" do
    context "with default settings" do
      it do
        expect(configuration.to_h).to eq({})
      end
    end

    context "with options set" do
      before do
        configuration.hostname = "example.com"
        configuration.mode = "hash"
        configuration.skip_dnt = true
        configuration.ignore_pages = "/vouchers"
      end

      it do
        expect(configuration.to_h).to eq(
          {
            hostname: "example.com",
            mode: "hash",
            skip_dnt: "true",
            ignore_pages: "/vouchers"
          }
        )
      end
    end

    context "with Turbolinks class being present" do
      before { class Turbolinks; end }
      after { Object.send(:remove_const, :Turbolinks) }

      it do
        expect(configuration.to_h).to eq(
          {
            turbolinks_track: "reload"
          }
        )
      end
    end
  end
end
