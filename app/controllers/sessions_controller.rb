class SessionsController < ApplicationController
  skip_authorization_check
  respond_to :html, :json

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    respond_to do |format|
      if @user
        cookies.permanent[:email] = @user.email
        format.html { redirect_to root_url, :notice => "Logged in" }
        format.json { render "users/show" }
      else
        flash.now.alert = "Email is invalid"
        format.html { render :new }
        format.json { render :json => "Email is invalid", :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    cookies.delete(:email)
    respond_to do |format|
      format.html { redirect_to root_url, :notice => "Logged out" }
      format.json { head :no_content }
    end
  end
end
