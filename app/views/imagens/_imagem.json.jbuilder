json.extract! imagem, :id, :produto_id, :created_at, :updated_at
json.url imagem_url(imagem, format: :json)