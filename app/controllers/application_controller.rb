class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  check_authorization

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_url, :alert => "Access Denied" }
      format.json { render :json => { :error => "Access Denied"}, :status => :forbidden }
    end
  end

  private

  def current_user
    token = request.headers['HTTP_AUTHORIZATION'] || cookies[:facebook_access_token]
    @current_user ||= User.find_by_facebook_access_token!(token) if token
  end
  helper_method :current_user

end
