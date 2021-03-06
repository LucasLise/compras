class Endereco < ApplicationRecord
  has_many :pedidos
  belongs_to :user
  belongs_to :municipio
  belongs_to :unidade_federativa

  validates_presence_of :logradouro, :rua, :numero, :complemento, :bairro, :cep
end
