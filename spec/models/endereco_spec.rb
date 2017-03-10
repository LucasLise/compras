require 'rails_helper'

RSpec.describe Endereco, type: :model do
  context "validações" do
    it "campos obrigatórios" do
      expect(subject).to validate_presence_of(:logradouro)
      expect(subject).to validate_presence_of(:numero)
      expect(subject).to validate_presence_of(:complemento)
      expect(subject).to validate_presence_of(:bairro)
      expect(subject).to validate_presence_of(:cep)
    end
    it "associações" do
      expect(subject).to belong_to(:municipio)
      expect(subject).to belong_to(:unidade_federativa)    
    end
  end
end
