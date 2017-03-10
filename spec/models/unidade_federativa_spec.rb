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
end
