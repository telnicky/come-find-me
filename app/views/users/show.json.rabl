object @user
attributes :id, :email, :first_name, :last_name, :facebook_id

node(:unread_messages_count) do |user|
  user.unread_messages.count
end
