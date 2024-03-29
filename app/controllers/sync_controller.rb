class SyncController < ApplicationController
  authorize_resource :class => false

  def index
    fetch(:locations,
          :messages)
  end

  private

  def fetch(*resources)
    resources.each do |resource|
      method = "fetch_" + resource.to_s
      self.__send__(method)
    end
  end

  def fetch_locations
    @locations ||= current_user.locations.by_updated_at(from_date)
  end

  def fetch_messages
    @messages ||= current_user.messages.by_updated_at(from_date)
  end

  def from_date
    if params[:from_date].present?
      Date.parse(params[:from_date])
    else
      Date.new
    end
  end
end
