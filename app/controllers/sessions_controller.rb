class SessionsController < ApplicationController
  respond_to :html, :json
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    respond_to do |format|
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        format.html { redirect_to root_url, :notice => "Logged in" }
      else
        flash.now.alert = "Email or Password is invalid"
        format.html { render :new }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to root_url, :notice => "Logged out" }
    end
  end
end
