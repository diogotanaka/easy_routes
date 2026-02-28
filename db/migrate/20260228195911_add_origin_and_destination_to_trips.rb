class AddOriginAndDestinationToTrips < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :origin, :string
    add_column :trips, :destination, :string
  end
end
