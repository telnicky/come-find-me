class SessionsController < ApplicationController
  skip_authorization_check
  respond_to :html, :json

  def new
  end

  def create
    if User.exists?(:facebook_id => params[:facebook_id])
      @user = User.find_by_facebook_id(params[:facebook_id])
    else
      new_user = User.new(user_auth_params)
      @user = new_user if new_user.save
    end

    respond_to do |format|
      if @user && @user.authenticate(params[:facebook_access_token])
        cookies.permanent[:facebook_access_token] = @user.facebook_access_token
        format.html { redirect_to root_url, :notice => "Logged in" }
        format.json { render "users/show" }
      else
        flash.now.alert = "Login was invalid"
        format.html { render :new }
        format.json { render :json => "Login was invalid", :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    cookies.delete(:facebook_access_token)
    respond_to do |format|
      format.html { redirect_to root_url, :notice => "Logged out" }
      format.json { head :no_content }
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_auth_params
    {
      :facebook_access_token => params[:facebook_access_token],
      :facebook_id => params[:facebook_id]
    }
  end

end
