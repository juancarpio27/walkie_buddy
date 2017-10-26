class CreateWalkers < ActiveRecord::Migration[5.0]
  def change
    create_table :walkers do |t|

      t.string :name
      t.string :lastname
      t.string :email
      t.string :phone
      t.integer :trips_sum
      t.integer :trips_total
      t.text :biography
      t.integer :location

      t.timestamps
    end
  end
end
