class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :car_model
      t.float :rent_price
      t.float :kilometers
      t.integer :release_year
      t.string :car_location

      t.timestamps
    end
  end
end
