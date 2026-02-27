class Trip < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :origin, :destination, presence: true
=======
  self_table_name = "trips"
  belongs_to :user, foreign_key: :id_users
  has_one :messages, foreign_key: :id_trips, dependent: :destroy

  validates :destination_name, presence: true
  validates :initial_location, presence: true

>>>>>>> 0b2d81ffcac17fde834c16aaf9a0ea46136bd888
end

