object @message
attributes :id, :user_id, :location_id, :sender_id

node :updated_at do |message|
  # YYYY-MM-DD HH:MM:SS ±HHMM
  message.updated_at.strftime("%F %T %z")
end

child :location do
  extends "locations/show"
end

child :sender => :sender do
  extends "users/show"
end

child :receivers => :receivers do
  extends "users/index"
end
