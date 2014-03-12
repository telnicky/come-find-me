class LocationRequestsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => :new
  before_action :set_location_request, only: [:show, :edit, :update, :destroy]

  # GET /location_requests
  def index
    @location_requests = LocationRequest.by_user(current_user) if current_user
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

    respond_to do |format|
      if @location_request.save
        format.html { redirect_to @location_request, notice: 'location_request was successfully created.' }
        format.json { render :json => @location_request }
      else
        format.html { render :action => :new }
        format.json { render json: @location_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_requests/1
  def update
    respond_to do |format|
      if @location_request.update(location_request_params)
        format.html { redirect_to @location_request, notice: 'location_request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => :edit }
        format.json { render json: @location_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_requests/1
  def destroy
    @location_request.destroy
    respond_to do |format|
      format.html { redirect_to location_request_url }
      format.json { head :no_content }
    end
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
