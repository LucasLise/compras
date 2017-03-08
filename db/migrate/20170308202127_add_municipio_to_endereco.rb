class AddMunicipioToEndereco < ActiveRecord::Migration[5.0]
  def change
    add_reference :enderecos, :municipio, foreign_key: true
  end
end
