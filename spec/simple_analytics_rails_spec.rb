RSpec.describe SimpleAnalyticsRails do
  describe "::configure" do
    subject do
      SimpleAnalyticsRails.configure do |configuration|
        configuration.enabled = false
      end
    end

    it "Allows configuration of gem via block" do
      expect { subject }
        .to change { SimpleAnalyticsRails.configuration.enabled? }.from(true).to(false)
    end
  end

  describe "::configuration" do
    it do
      expect(SimpleAnalyticsRails.configuration).to be_an_instance_of(SimpleAnalyticsRails::Configuration)
    end
  end

  describe "::reset_configuration!" do
    before do
      SimpleAnalyticsRails.configure do |configuration|
        configuration.enabled = false
      end
    end

    it do
      expect { SimpleAnalyticsRails.reset_configuration! }
        .to change { SimpleAnalyticsRails.configuration.enabled? }.from(false).to(true)
    end
  end
end
