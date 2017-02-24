class Carrinho < ApplicationRecord
  belongs_to :user
  has_many :itens_carrinho
end
