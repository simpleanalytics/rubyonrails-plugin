RSpec.describe SimpleAnalyticsRails::Middleware::JavascriptInjection do
  let(:env) { :env }
  let(:status) { 200 }
  let(:headers) { {"Content-Type" => "text/html"} }
  let(:response) { ["<html><head><title>Sample App</title></head><body></body></html>"] }
  let(:app) { double(:app, call: [status, headers, response]) }
  let(:javascript_injection) { described_class.new(app) }

  describe "#call(env)" do
    context "when headers are blank" do
      let(:headers) { nil }

      it do
        expect { javascript_injection.call(env) }.to_not raise_error
      end
    end

    context "when content-type is text/json" do
      let(:headers) { {"Content-Type" => "text/json"} }

      it do
        _new_status, _new_headers, new_response = javascript_injection.call(env)
        expect(new_response).to eq(response)
      end
    end

    context "when content-type is text/html" do
      let(:headers) { {"Content-Type" => "text/html"} }

      it do
        _new_status, _new_headers, new_response = javascript_injection.call(env)
        expect(new_response[0]).to include("https://scripts.simpleanalyticscdn.com/latest.js")
      end
    end

    context "when content-type is text/html, but enabled is false" do
      let(:headers) { {"Content-Type" => "text/html"} }
      before do
        SimpleAnalyticsRails.configuration.enabled = false
      end

      it do
        _new_status, _new_headers, new_response = javascript_injection.call(env)
        expect(new_response).to eq(response)
      end
    end
  end
end
