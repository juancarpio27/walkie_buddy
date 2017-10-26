class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|

      t.integer :user_id, null: false
      t.integer :walker_id, null: false
      t.integer :price, null: false
      t.datetime :date, null: false
      t.string :address

      t.timestamps
    end
    add_foreign_key :trips, :users
    add_foreign_key :trips, :walkers
  end
end
