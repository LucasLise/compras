class Marca < ApplicationRecord
  validates_presence_of :descricao
  validates :descricao, length: { maximum: 20 }
  has_many :produtos

  def to_s
    self.descricao
  end
end
