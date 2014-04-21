object @message
attributes :id, :user_id, :location_id, :sender_id

node :created_at do |message|
  # YYYY-MM-DD HH:MM:SS ±HHMM
  message.created_at.strftime("%F %T %z")
end

child :location do
  extends "locations/show"
end

child :sender => :sender do
  extends "users/show"
end

child :receivers, :root => :receivers, :object_root => false do
  extends "users/index"
end
