class CreateDrawings < ActiveRecord::Migration[6.0]
  def change
    create_table :drawings do |t|
      t.text :title, null: false
      t.text :description
      t.integer :category_id, null: false
      t.integer :genre_id, null: false
      t.date :production_date, null: false
      t.integer :price
      t.integer :shipping_method_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
