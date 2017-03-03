class ItemPedido < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto
  validates_presence_of :quantidade
end
