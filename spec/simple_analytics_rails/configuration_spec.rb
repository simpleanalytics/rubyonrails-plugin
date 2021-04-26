RSpec.describe SimpleAnalyticsRails::Configuration do
  let(:configuration) { described_class.new }

  describe "#enabled=" do
    it do
      expect { configuration.enabled = false }
        .to change(configuration, :enabled?).from(true).to(false)
    end
  end

  describe "#collect_dnt=" do
    it do
      expect { configuration.collect_dnt = true }
        .to change(configuration, :collect_dnt?).from(false).to(true)
    end
  end

  describe "#custom_sa_global?" do
    it do
      expect { configuration.sa_global = "pa" }.to change(configuration, :custom_sa_global?).from(false).to(true)
    end
  end

  describe "#onload_callback?" do
    it do
      expect { configuration.onload_callback = "onloadCallback()" }.to change(configuration, :onload_callback?).from(false).to(true)
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
        configuration.collect_dnt = true
        configuration.ignore_pages = "/vouchers"
      end

      it do
        expect(configuration.to_h).to eq(
          {
            hostname: "example.com",
            mode: "hash",
            collect_dnt: "true",
            ignore_pages: "/vouchers"
          }
        )
      end
    end

    context "with Turbolinks class being present" do
      let(:fake_class) { Class.new }
      it do
        stub_const("Turbolinks", fake_class)
        expect(configuration.to_h).to eq(
          {
            turbolinks_track: "reload"
          }
        )
      end
    end
  end
end
