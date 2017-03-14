class AddAttachmentImagemToImagens < ActiveRecord::Migration
  def self.up
    change_table :imagens do |t|
      t.attachment :imagem
    end
  end

  def self.down
    remove_attachment :imagens, :imagem
  end
end
