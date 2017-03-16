class Imagem < ApplicationRecord
  belongs_to :produto
  has_attached_file :imagem, styles: { medium: "300x300>", thumb: "70x70>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :imagem, content_type: /\Aimage\/.*\z/
  validates_presence_of :imagem
end
