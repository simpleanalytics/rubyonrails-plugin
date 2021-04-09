require "rails_helper"

RSpec.describe "Middleware", type: :request do
  it "see the injected Javascript Snippet" do
    get root_path
    expect(response.body).to include('https://scripts.simpleanalyticscdn.com/latest.js')
  end
end
