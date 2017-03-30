require 'rails_helper'

RSpec.describe Categoria, type: :model do
  context 'validações' do
    it 'campos obrigatorios' do
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
      categoria = FactoryGirl.build(:categoria, descricao: 'Categoria')
      expect(categoria.to_s).to eql("#{categoria.id} - Categoria")
    end
  end
end
