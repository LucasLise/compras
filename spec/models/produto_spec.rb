require 'rails_helper'

RSpec.describe Produto, type: :model do
    context 'validações' do
      it 'campos obrigatórios' do
        expect(subject).to validate_presence_of(:descricao)
        expect(subject).to validate_presence_of(:preco)
        expect(subject).to validate_presence_of(:quantidade)
      end

      it 'associações' do
        expect(subject).to belong_to(:marca)
        expect(subject).to belong_to(:categoria)
        expect(subject).to have_many(:itens_carrinho)
        expect(subject).to have_many(:itens_pedido)
      end

      it 'length' do
        expect(subject).to validate_length_of(:descricao).is_at_most(20)
     end
   end
end
