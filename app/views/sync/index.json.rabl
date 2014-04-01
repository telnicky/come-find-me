object current_user
attributes :id, :email, :name, :auth_token

child @locations do
  extends "locations/show"
end

child @location_requests do
  extends "location_requests/show"
end
