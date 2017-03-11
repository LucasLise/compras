json.extract! comentario, :id, :descricao, :user_id, :produto_id, :created_at, :updated_at
json.url comentario_url(comentario, format: :json)