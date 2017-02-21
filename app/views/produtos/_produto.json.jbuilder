json.extract! produto, :id, :descricao, :preco, :created_at, :updated_at
json.url produto_url(produto, format: :json)