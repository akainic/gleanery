class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :neighborhood
      t.string :street_address, null: false
      t.string :city, null: false

      t.timestamps
    end
  end
end
