class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.text :destination_name
      t.text :initial_location

      t.timestamps
    end
  end
end
