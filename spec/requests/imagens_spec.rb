require 'rails_helper'

RSpec.describe "Imagens", type: :request do
  describe "GET /imagens" do
    it "works! (now write some real specs)" do
      get imagens_path
      expect(response).to have_http_status(200)
    end
  end
end
