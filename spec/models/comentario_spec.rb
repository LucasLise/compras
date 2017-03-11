require 'rails_helper'

RSpec.describe Comentario, type: :model do
  context "validações" do
    it "campos obrigatorios" do
      expect(subject).to validate_presence_of(:descricao)
    end
  end
end
