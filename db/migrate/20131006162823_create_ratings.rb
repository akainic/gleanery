class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :vegan
      t.integer :vegetarian
      t.integer :gluten_free
      t.integer :overall
      t.integer :restaurant_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
