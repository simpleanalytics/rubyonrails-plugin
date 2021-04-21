require "rails_helper"

RSpec.describe "Example App (Integration) - Middleware", type: :request do
  it "sees the injected Javascript Snippet" do
    get root_path
    expect(response.body).to include('<script async defer src="https://scripts.simpleanalyticscdn.com/latest.js')
  end

  it "sees the <noscript> fallback" do
    get root_path
    expect(response.body).to include('<noscript><img src="https://queue.simpleanalyticscdn.com/noscript.gif" alt="" referrerpolicy="no-referrer-when-downgrade" /></noscript>')
  end
end
