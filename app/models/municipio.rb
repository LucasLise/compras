class Municipio < ApplicationRecord
  belongs_to :unidade_federativa
  has_many :enderecos
end
