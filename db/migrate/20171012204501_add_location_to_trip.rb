class AddLocationToTrip < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :location_id, :integer
  end
end
