class Categoria < ApplicationRecord
  has_many :produtos
  validates_presence_of :descricao

  def to_s
    "#{id} - #{descricao}"
  end
end
