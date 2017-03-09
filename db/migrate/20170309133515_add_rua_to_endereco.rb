class AddRuaToEndereco < ActiveRecord::Migration[5.0]
  def change
    add_column :enderecos, :rua, :string
  end
end
