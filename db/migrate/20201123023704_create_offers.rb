class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :budget, null: false
      t.string :order_name, null: false
      t.integer :category_id, null: false
      t.integer :genre_id, null: false
      t.text :detail, null: false
      t.date :deadline, null: false
      t.references :user, foreign_key: true
      t.references :creater_id, null: false
      t.timestamps
    end
  end
end
