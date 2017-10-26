class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|

      t.string :name
      t.string :breed
      t.integer :size


      t.timestamps
    end
  end
end
