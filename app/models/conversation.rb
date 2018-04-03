class Conversation < ApplicationRecord

  belongs_to :user, foreign_key: "sender_id"
  belongs_to :user, foreign_key: "receiver_id"
  has_many :messages

end
