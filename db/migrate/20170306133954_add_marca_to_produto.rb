class AddMarcaToProduto < ActiveRecord::Migration[5.0]
  def change
    add_reference :produtos, :marca, foreign_key: true
  end
end
