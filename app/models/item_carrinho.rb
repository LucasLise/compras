class ItemCarrinho < ApplicationRecord
  belongs_to :carrinho
  belongs_to :produto
  has_many :produtos
  validates_presence_of :quantidade
end
