class AddValorTotalToPedido < ActiveRecord::Migration[5.0]
  def change
    add_column :pedidos, :valor_total, :decimal
  end
end
