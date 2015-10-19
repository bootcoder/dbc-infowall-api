require 'rails_helper'

RSpec.describe "TextScrolls", type: :request do
  describe "GET /text_scrolls" do
    it "works! (now write some real specs)" do
      get text_scrolls_path
      expect(response).to have_http_status(200)
    end
  end
end
