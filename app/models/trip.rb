class Trip < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :origin, :destination, presence: true
end

