class AddForeignKeysToUsersAndKeys < ActiveRecord::Migration[5.0]
  def change
  	add_reference :users, :key, foreign_key: true
  	add_reference :keys, :user, foreign_key: true
  end
end
