class BroadcastsController < ApplicationController
  load_and_authorize_resource :except => [:message_broadcasts]
  before_action :set_broadcast, only: [:show, :edit, :destroy]

  # GET /broadcasts
  def index
    @broadcasts = Broadcast.by_user(current_user)
  end

  # GET /broadcasts/1
  def show
  end

  # GET /broadcasts/new
  def new
    @broadcast = Broadcast.new
  end

  # GET /broadcasts/1/edit
  def edit
  end

  # POST /broadcasts
  def create
    @broadcast = Broadcast.new(broadcast_params)
    respond_to do |format|
      if @broadcast.save
        format.html { redirect_to @broadcast, notice: 'Broadcast was successfully created.' }
        format.json { render :json => @broadcast }
      else
        format.html { render :action => :new }
        format.json { render json: @broadcast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /broadcasts/1
  def destroy
    @broadcast.destroy
    respond_to do |format|
      format.html { redirect_to broadcasts_url }
      format.json { head :no_content }
    end
  end

  # GET /messages/1/broadcasts
  def message_broadcasts
    @broadcasts = Broadcast.by_message_id(params[:id]).by_user(current_user)
    authorize!(:message_broadcasts, Broadcast)
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_broadcast
      @broadcast = Broadcast.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def broadcast_params
      params.require(:broadcast).permit(:user_id, :sender_id, :message_id)
    end
end
