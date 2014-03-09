class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    respond_to do |format|
      format.html { redirect_to root_url, :notice => "email sent with password reset instructions" }
    end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])

    respond_to do |format|
      if @user.password_reset_sent_at < 2.hours.ago
        format.html { redirect_to new_password_reset_path, :alert => "Password Reset has expired" }
      elsif @user.update_attributes(user_params)
        format.html { redirect_to root_url, :notice => "Password has been reset"}
      else
        format.html { render :edit }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:password, :password_confirmation, :password_digest)
  end

end
