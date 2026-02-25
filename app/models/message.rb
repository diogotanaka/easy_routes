class Message < ApplicationRecord
  self.table_name = "messages"

  belongs_to :trip
  belongs_to :user

  validates :content, presence: true
end
