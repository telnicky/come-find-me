object @user
attributes :id, :email, :first_name, :last_name, :facebook_id

node(:unread_messages_count) do |user|
  user.unread_messages.count
end

node(:current_location) do |user|
  if locals[:broadcast] || user.id == current_user.id
    partial("locations/show", :object => user.current_location)
  end
end

#child :current_location => :current_location, :object_root => false, :if => lambda { |user|
#  user.id == current_user.id || locals[:broadcast] } do
#    extends "locations/show"
#  end
