object current_user
attributes :id, :email, :name, :first_name, :last_name

child @locations do
  extends "locations/show"
end

child @messages do
  extends "messages/show"
end
