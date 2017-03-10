require 'rails_helper'

RSpec.describe Municipio, type: :model do
  context "validações" do
    it "campos obrigatórios" do
      expect(subject).to validate_presence_of(:nome)
    end
    it "associações" do
      expect(subject).to have_many(:enderecos)
      expect(subject).to belong_to(:unidade_federativa)
    end
  end
end
