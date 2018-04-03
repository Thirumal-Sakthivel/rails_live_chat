class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user, foreign_key: "sender_id"
  scope :for_display, -> { order(created_at: :desc).last(4) }

  def message_time
    self.created_at.in_time_zone(TZInfo::Timezone.get('Asia/Kolkata')).strftime("%A, %d %b %Y %l:%M %p")
  end
end
