class Message < ApplicationRecord
  belongs_to :trip

<<<<<<< HEAD
  validates :content, :role, presence: true
=======
  belongs_to :trip
  belongs_to :user

  validates :content, presence: true
>>>>>>> 0b2d81ffcac17fde834c16aaf9a0ea46136bd888
end
