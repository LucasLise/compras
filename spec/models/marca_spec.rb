require 'rails_helper'

RSpec.describe Marca, type: :model do
  context 'validações' do
    it 'campos obrigatórios' do
      expect(subject).to validate_presence_of(:descricao)
    end

    it 'length' do
      validate_length_of(:descricao).is_at_most(20)
    end

    it 'associações' do
      expect(subject).to have_many(:produtos)
    end
  end

  context "metodos" do
    it "deve retornar descricao" do
      marca = FactoryGirl.build(:marca, descricao: 'Marca')
      expect(marca.to_s).to eql('Marca')
    end
  end
end
