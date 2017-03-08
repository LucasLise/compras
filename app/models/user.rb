class User < ApplicationRecord
  enum role: [:normal_user, :admin]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :nome, :cpf
  validates_uniqueness_of :cpf
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carrinhos
  has_many :pedidos
  has_many :enderecos
end
