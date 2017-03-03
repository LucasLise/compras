require 'rails_helper'

RSpec.describe Carrinho, type: :model do
  context 'validações' do
    it 'associações' do
      expect(subject).to belong_to(:user)
      expect(subject).to have_many(:itens_carrinho)
    end
  end
end
