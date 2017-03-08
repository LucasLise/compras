require 'rails_helper'

RSpec.describe "Enderecos", type: :request do
  describe "GET /enderecos" do
    it "works! (now write some real specs)" do
      get enderecos_path
      expect(response).to have_http_status(200)
    end
  end
end
