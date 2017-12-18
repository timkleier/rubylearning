require 'rails_helper'

RSpec.describe "MetaTags", type: :request do
  describe "GET /meta_tags" do
    it "works! (now write some real specs)" do
      get meta_tags_path
      expect(response).to have_http_status(200)
    end
  end
end
