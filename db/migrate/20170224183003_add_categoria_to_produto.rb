class AddCategoriaToProduto < ActiveRecord::Migration[5.0]
  def change
    add_reference :produtos, :categoria, foreign_key: true
  end
end
