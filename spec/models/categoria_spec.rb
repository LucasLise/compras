require 'rails_helper'

RSpec.describe Categoria, type: :model do
  context 'validações' do
    it 'campos obrigatorios' do
      expect(subject).to validate_presence_of(:descricao)
    end

    it 'associações' do
      expect(subject).to have_many(:produtos)
    end
  end
end
