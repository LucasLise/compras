json.extract! item_pedido, :id, :pedido_id, :produto_id, :quantidade, :created_at, :updated_at
json.url item_pedido_url(item_pedido, format: :json)