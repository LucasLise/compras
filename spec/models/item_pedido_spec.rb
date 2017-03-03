require 'rails_helper'

RSpec.describe ItemPedido, type: :model do
  context 'validações' do
    it 'campos obrigatórios' do
      expect(subject).to validate_presence_of(:quantidade)
    end

    it 'associações' do
      expect(subject).to belong_to(:produto)
      expect(subject).to belong_to(:pedido)
    end
  end
end
