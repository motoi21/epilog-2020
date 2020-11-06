class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text :introduction
      t.integer :category_id, null: false
      t.integer :genre_id, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
