require 'rails_helper'

RSpec.describe Imagem, type: :model do
  context "validações" do
    
    it "campos obrigatórios" do
      expect(subject).to validate_presence_of(:imagem)
    end

    it "associações" do
      expect(subject).to belong_to(:produto)
    end
  end
end
