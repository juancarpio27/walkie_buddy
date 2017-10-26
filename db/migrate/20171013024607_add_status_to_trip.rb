class AddStatusToTrip < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :status, :integer
  end
end
