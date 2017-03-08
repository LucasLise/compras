class AddUserToEndereco < ActiveRecord::Migration[5.0]
  def change
    add_reference :enderecos, :user, foreign_key: true
  end
end
