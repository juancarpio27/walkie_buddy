class CreatePetTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :pet_trips do |t|

      t.integer :trip_id
      t.integer :pet_id

      t.timestamps
    end
    add_foreign_key :pet_trips, :trips
    add_foreign_key :pet_trips, :pets
  end
end
