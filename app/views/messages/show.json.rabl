object @message
attributes :id, :user_id, :location_id, :sender_id

child :location do
  extends "locations/show"
end

child :sender => :sender do
  extends "users/show"
end

child :receivers => :receivers do
  extends "users/index"
end
