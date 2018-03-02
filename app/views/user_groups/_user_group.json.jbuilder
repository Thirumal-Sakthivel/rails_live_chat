json.extract! user_group, :id, :user_id, :group_id, :status, :created_at, :updated_at
json.url user_group_url(user_group, format: :json)
