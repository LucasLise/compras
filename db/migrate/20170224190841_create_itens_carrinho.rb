class CreateItensCarrinho < ActiveRecord::Migration[5.0]
  def change
    create_table :itens_carrinho do |t|
      t.references :carrinho, foreign_key: true
      t.references :produto, foreign_key: true
      t.integer :quantidade

      t.timestamps
    end
  end
end
