class CreateTrips < ActiveRecord::Migration[7.1]
 def change
    create_table :trips do |t|
      t.references :user, foreign_key: true
      t.string :origin
      t.string :destination
      t.date :start_date
      t.timestamps
    end
  end
end
