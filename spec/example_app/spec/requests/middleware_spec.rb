require "rails_helper"

RSpec.describe "Example App (Integration) - Middleware", type: :request do
  it "sees the injected Javascript Snippet" do
    get root_path
    expect(response.body).to include('<script async defer src="https://scripts.simpleanalyticscdn.com/latest.js')
  end
end
