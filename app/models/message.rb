class Message < ApplicationRecord
  belongs_to :trip

  validates :content, :role, presence: true
end
