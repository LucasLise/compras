class AddEnderecoToPedido < ActiveRecord::Migration[5.0]
  def change
    add_reference :pedidos, :endereco, foreign_key: true
  end
end
