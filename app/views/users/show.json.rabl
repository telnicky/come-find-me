object @user
attributes :id, :email, :first_name, :last_name, :facebook_id, :current_location_id

node(:unread_messages_count) do |user|
  user.unread_messages.count
end

node(:current_location) do |user|
  if locals[:broadcast] || user.id == current_user.id
    partial("locations/show", :object => user.current_location)
  end
end

