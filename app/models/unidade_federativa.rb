class UnidadeFederativa < ApplicationRecord
  has_many :municipios
  has_many :enderecos

  validates_presence_of :sigla, :descricao
  validates_uniqueness_of :sigla

  def to_s
    "#{self.sigla} - #{self.descricao}"
  end

  def retorna_sigla
    self.sigla
  end
end
