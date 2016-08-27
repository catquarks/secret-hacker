class CreateSecrets < ActiveRecord::Migration[5.0]
  def change
    create_table :secrets do |t|
      t.string :content
      t.string :subject

      t.timestamps
    end
  end
end
