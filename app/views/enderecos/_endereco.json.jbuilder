json.extract! endereco, :id, :logradouro, :numero, :complemento, :bairro, :cep, :cidade, :uf, :created_at, :updated_at
json.url endereco_url(endereco, format: :json)