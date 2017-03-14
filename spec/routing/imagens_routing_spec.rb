require "rails_helper"

RSpec.describe ImagensController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/imagens").to route_to("imagens#index")
    end

    it "routes to #new" do
      expect(:get => "/imagens/new").to route_to("imagens#new")
    end

    it "routes to #show" do
      expect(:get => "/imagens/1").to route_to("imagens#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/imagens/1/edit").to route_to("imagens#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/imagens").to route_to("imagens#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/imagens/1").to route_to("imagens#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/imagens/1").to route_to("imagens#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/imagens/1").to route_to("imagens#destroy", :id => "1")
    end

  end
end
