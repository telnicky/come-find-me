class SyncController < ApplicationController
  authorize_resource :class => false

  def index
    fetch(:friends,
          :friendships,
          :inverse_friends,
          :inverse_friendships,
          :locations,
          :location_requests)
  end

  private

  def fetch(*resources)
    resources.each do |resource|
      method = "fetch_" + resource.to_s
      self.__send__(method)
    end
  end

  def fetch_friends
    @friends ||= current_user.friends.by_updated_at(from_date)
  end

  def fetch_friendships
    @friendships ||= current_user.friendships.by_updated_at(from_date)
  end

  def fetch_inverse_friends
    @inverse_friends ||= current_user.inverse_friends.by_updated_at(from_date)
  end

  def fetch_inverse_friendships
    @inverse_friendships ||= current_user.friendships.by_updated_at(from_date)
  end

  def fetch_locations
    @locations ||= current_user.locations.by_updated_at(from_date)
  end

  def fetch_location_requests
    @location_requests ||= current_user.location_requests.by_updated_at(from_date)
  end

  def from_date
    if params[:from_date].present?
      Date.parse(params[:from_date])
    else
      Date.new
    end
  end
end
