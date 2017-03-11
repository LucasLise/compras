class Produto < ApplicationRecord
  has_many :comentarios
  belongs_to :marca
  belongs_to :item_carrinho
  belongs_to :categoria
  has_many :itens_carrinho
  has_many :itens_pedido
  has_attached_file :imagem, styles: { medium: "300x300>", thumb: "100x100>"}, default_url: "/imagens/:style/missing.png"
  validates_attachment_content_type :imagem, content_type: /\Aimage\/.*\z/
  validates_presence_of :descricao, :preco, :quantidade
  validates :descricao, length: { maximum: 20 }
end
