class UnidadeFederativa < ApplicationRecord
  has_many :municipios
  has_many :enderecos
end
