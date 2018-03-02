json.extract! message_recipient, :id, :recipient_id, :message_id, :recipient_group_id, :created_at, :updated_at
json.url message_recipient_url(message_recipient, format: :json)
