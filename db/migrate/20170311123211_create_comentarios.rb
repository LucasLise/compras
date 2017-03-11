class CreateComentarios < ActiveRecord::Migration[5.0]
  def change
    create_table :comentarios do |t|
      t.string :descricao
      t.references :user, foreign_key: true
      t.references :produto, foreign_key: true

      t.timestamps
    end
  end
end
