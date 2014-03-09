class SessionsController < ApplicationController
  respond_to :html, :json
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    respond_to do |format|
      if user && user.authenticate(params[:password])
        cookies.permanent[:auth_token] = user.auth_token
        format.html { redirect_to root_url, :notice => "Logged in" }
        format.json { head :no_content }
      else
        flash.now.alert = "Email or Password is invalid"
        format.html { render :new }
        format.json { render :json => "Email or Password is invalid", :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    cookies.delete(:auth_token)
    respond_to do |format|
      format.html { redirect_to root_url, :notice => "Logged out" }
    end
  end
end
