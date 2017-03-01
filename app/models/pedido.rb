class Pedido < ApplicationRecord
  belongs_to :user
  has_many :itens_pedido
end
