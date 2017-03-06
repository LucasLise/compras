require 'rails_helper'

RSpec.describe ItemPedido, type: :model do
  context 'validações' do
    it 'campos obrigatórios' do
      expect(subject).to validate_presence_of(:quantidade)
      expect(subject).to validate_presence_of(:valor_total)
      expect(subject).to validate_presence_of(:valor_unitario)
    end

    it 'associações' do
      expect(subject).to belong_to(:produto)
      expect(subject).to belong_to(:pedido)
    end
  end

  context 'calculos' do
    it 'atribui corretamente valor unitario' do
      produto = FactoryGirl.create(:produto, preco: 1231)
      item = ItemPedido.new(produto: produto, quantidade: 10)
      item.calcula_valores
      expect(item.valor_unitario).to eq(1231)
    end

    it 'calcula corretamente valor total' do
      produto = FactoryGirl.create(:produto, preco: 1231)
      item = ItemPedido.new(produto: produto, quantidade: 10)
      item.calcula_valores
      expect(item.valor_total).to eq(1231 * 10)
    end

  end

end
