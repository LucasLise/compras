class ItemPedido < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto
  validates_presence_of :quantidade, :valor_total, :valor_unitario

  def calcula_valores
    self.valor_unitario = produto.preco
    self.valor_total = self.valor_unitario * self.quantidade
  end
end
