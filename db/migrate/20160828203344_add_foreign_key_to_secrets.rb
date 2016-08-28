class AddForeignKeyToSecrets < ActiveRecord::Migration[5.0]
  def change
  	add_reference :secrets, :category, foreign_key: true
  end
end
