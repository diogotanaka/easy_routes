class Trip < ApplicationRecord
  self_table_name = "trips"
  belongs_to :user, foreign_key :id_users
  has_many :chat, foreign_key :id_trips, dependent: :destroy

  validates :destination_name, presence: true
  validates :initial_location, presence: true
end
