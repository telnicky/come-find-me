class SessionsController < ApplicationController
  skip_authorization_check
  respond_to :html, :json

  def new
  end

  def create
    @user = User.find_by_facebook_id(params[:facebook_id])
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
end
