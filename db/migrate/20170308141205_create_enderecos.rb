class CreateEnderecos < ActiveRecord::Migration[5.0]
  def change
    create_table :enderecos do |t|
      t.string :logradouro
      t.integer :numero
      t.string :complemento
      t.string :bairro
      t.string :cep
      t.string :cidade
      t.string :uf

      t.timestamps
    end
  end
end
