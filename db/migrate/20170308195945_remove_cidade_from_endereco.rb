class RemoveCidadeFromEndereco < ActiveRecord::Migration[5.0]
  def change
    remove_column :enderecos, :cidade, :string
    remove_column :enderecos, :uf, :string
  end
end
