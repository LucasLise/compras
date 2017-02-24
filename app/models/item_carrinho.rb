class ItemCarrinho < ApplicationRecord
  belongs_to :carrinho
  belongs_to :produto
  has_many :produtos
end
