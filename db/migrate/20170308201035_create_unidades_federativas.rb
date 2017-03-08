class CreateUnidadesFederativas < ActiveRecord::Migration[5.0]
  def change
    create_table :unidades_federativas do |t|
      t.string :sigla, limit: 2
      t.string :descricao

      t.timestamps
    end
  end
end
