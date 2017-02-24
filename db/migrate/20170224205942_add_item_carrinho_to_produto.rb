class AddItemCarrinhoToProduto < ActiveRecord::Migration[5.0]
  def change
    add_reference :produtos, :item_carrinho, foreign_key: true
  end
end
