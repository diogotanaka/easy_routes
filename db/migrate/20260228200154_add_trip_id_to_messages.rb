class AddTripIdToMessages < ActiveRecord::Migration[7.1]
  def change
    add_reference :messages, :trip, null: false, foreign_key: true
  end
end
