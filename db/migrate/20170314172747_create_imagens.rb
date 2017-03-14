class CreateImagens < ActiveRecord::Migration[5.0]
  def change
    create_table :imagens do |t|
      t.references :produto, foreign_key: true

      t.timestamps
    end
  end
end
