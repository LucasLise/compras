class Categoria < ApplicationRecord
  has_many :produtos
  validates_presence_of :descricao
  validates :descricao, length: { maximum: 20 }

  def to_s
    "#{id} - #{descricao}"
  end
end
