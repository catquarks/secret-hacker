class AddForeignKeysToSecrets < ActiveRecord::Migration[5.0]
  def change
    add_reference :secrets, :key, foreign_key: true
  end
end
