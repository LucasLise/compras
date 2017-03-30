require 'rails_helper'

RSpec.describe UnidadeFederativa, type: :model do
  context "validações" do
    it "campos obrigatorios" do
      expect(subject).to validate_presence_of(:sigla)
      expect(subject).to validate_presence_of(:descricao)
    end

    it "campo único" do
      expect(subject).to validate_uniqueness_of(:sigla)
    end
  end

  context "metodos" do
    it 'deve retornar sigla' do
      unidade_federativa = FactoryGirl.build(:unidade_federativa, sigla: 'SC')
      expect(unidade_federativa.sigla).to eql('SC')
    end

    it "deve retornar descricao" do
      unidade_federativa = FactoryGirl.build(:unidade_federativa, sigla: 'SC', descricao: 'Santa Catarina')
      expect(unidade_federativa.to_s).to eql('SC - Santa Catarina')
    end
  end
end
