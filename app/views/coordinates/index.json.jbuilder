json.array!(@coordinates) do |coordinate|
  json.extract! coordinate, :id, :longitude, :latitude, :to_user, :from_user
  json.url coordinate_url(coordinate, format: :json)
end
