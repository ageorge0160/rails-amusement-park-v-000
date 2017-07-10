class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def home
    render "layouts/application"
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def validate_session
    if !current_user
      redirect_to root_path
    end
  end

  helper_method :current_user
  helper_method :logged_in?
end
