class CreateJoinTableUserKey < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :keys do |t|
      # t.index [:user_id, :key_id]
      # t.index [:key_id, :user_id]
    end
  end
end
