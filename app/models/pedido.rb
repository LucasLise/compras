class Pedido < ApplicationRecord
  belongs_to :user
  has_many :itens_pedido
  validates_presence_of :valor_total
end
