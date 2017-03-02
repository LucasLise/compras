class AddValorUnitarioToItemPedido < ActiveRecord::Migration[5.0]
  def change
    add_column :itens_pedido, :valor_unitario, :decimal
  end
end
