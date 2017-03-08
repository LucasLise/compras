class Municipio < ApplicationRecord
  belongs_to :unidade_federativa
  has_many :enderecos

  validates_presence_of :nome

  def to_s
    self.nome
  end


end
