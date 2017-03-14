class Produto < ApplicationRecord
  has_many :imagens
  has_many :comentarios
  belongs_to :marca
  belongs_to :item_carrinho
  belongs_to :categoria
  has_many :itens_carrinho
  has_many :itens_pedido
  validates_presence_of :descricao, :preco, :quantidade
  validates :descricao, length: { maximum: 20 }
  accepts_nested_attributes_for :imagens, reject_if: :all_blank, allow_destroy: true
end
