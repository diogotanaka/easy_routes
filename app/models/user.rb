class User < ApplicationRecord
  has_many :trips, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
