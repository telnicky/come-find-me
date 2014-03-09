object @user
attributes :id, :email, :name, :auth_token

child :friends => :friends do
  attributes :id, :email, :name
end

child :inverse_friends => :inverse_friends do
  attributes :id, :email, :name
end

child :locations do
  extends "locations/show"
end

child :location_requests do
  extends "location_requests/show"
end
