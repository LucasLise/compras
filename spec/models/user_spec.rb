require 'rails_helper'

RSpec.describe User, type: :model do
    context 'validações' do
      it 'campos obrigatórios' do
        expect(subject).to validate_presence_of(:nome)
        expect(subject).to validate_presence_of(:cpf)
      end
      it 'campos únicos' do
        expect(subject).to validate_uniqueness_of(:cpf)
      end
   end
end
