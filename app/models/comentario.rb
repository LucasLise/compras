class Comentario < ApplicationRecord
  belongs_to :user
  belongs_to :produto

  validates_presence_of (:descricao)
end
