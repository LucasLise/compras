class CreateItensPedido < ActiveRecord::Migration[5.0]
  def change
    create_table :itens_pedido do |t|
      t.references :pedido, foreign_key: true
      t.references :produto, foreign_key: true
      t.integer :quantidade

      t.timestamps
    end
  end
end
