class AddDurationEndToTrip < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :duration, :integer
    add_column :trips, :finish_time, :datetime
  end
end
