class LocationRequestsController < ApplicationController
  before_action :set_location_request, only: [:show, :edit, :update, :destroy]

  # GET /location_requests
  def index
    @location_requests = LocationRequest.all
  end

  # GET /location_requests/1
  def show
  end

  # GET /location_requests/new
  def new
    @location_request = LocationRequest.new
  end

  # GET /location_requests/1/edit
  def edit
  end

  # POST /location_requests
  def create
    @location_request = LocationRequest.new(location_request_params)

    if @location_request.save
      redirect_to @location_request, notice: 'Location request was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /location_requests/1
  def update
    if @location_request.update(location_request_params)
      redirect_to @location_request, notice: 'Location request was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /location_requests/1
  def destroy
    @location_request.destroy
    redirect_to location_requests_url, notice: 'Location request was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_request
      @location_request = LocationRequest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def location_request_params
      params.require(:location_request).permit(:user_id, :location_id)
    end
end
