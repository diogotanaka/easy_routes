class Message < ApplicationRecord
  self.table_name = "messages"

  belongs_to :chat, foreign_key: "id_chats"

  validates :request, presence: true
end

