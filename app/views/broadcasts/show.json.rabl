object @broadcast
attributes :id, :user_id, :sender_id, :message_id

child :message do
  extends "messages/show"
end

child :sender => :sender do
  extends "users/show", :locals => { :broadcast => true }
end

child :user do
  extends "users/show"
end
