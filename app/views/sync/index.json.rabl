object current_user
attributes :id, :email, :name

child @locations do
  extends "locations/show"
end

child @messages do
  extends "messages/show"
end
