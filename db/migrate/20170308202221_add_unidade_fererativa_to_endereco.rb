class AddUnidadeFererativaToEndereco < ActiveRecord::Migration[5.0]
  def change
    add_reference :enderecos, :unidade_federativa, foreign_key: true
  end
end
