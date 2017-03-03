require 'rails_helper'

RSpec.describe Pedido, type: :model do
  context 'validações' do
    it 'campos obrigatórios' do
      expect(subject).to validate_presence_of(:valor_total)
    end

    it 'associações' do
      expect(subject).to belong_to(:user)
      expect(subject).to have_many(:itens_pedido)
    end
  end
end
