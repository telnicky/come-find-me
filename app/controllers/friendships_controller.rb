class FriendshipsController < ApplicationController
  load_and_authorize_resource
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  # GET /friendships
  def index
    @friendships = Friendship.by_user(current_user) if current_user
  end

  # GET /friendships/1
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  # POST /friendships
  def create
    @friendship = Friendship.new(create_params)

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to @friendship, notice: 'Friendship was successfully created.' }
        format.json { render :json => @friendship }
      else
        format.html { render :action => :new }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friendships/1
  def update
    respond_to do |format|
      if @friendship.update(update_params)
        format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => :edit }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to friendships_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :accepted)
    end

    def create_params
      friendship_params.slice(:user_id, :friend_id)
    end

    def update_params
      friendship_params.slice(:accepted)
    end
end
