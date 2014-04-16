class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= authenticate_user
  end
  helper_method :current_user

  def user_signed_in?
    !!current_user
  end
  helper_method :user_signed_in?

  def login
    sign_in(User.random)
    redirect_to :root
  end

  def logout
    session.delete(:user_id)
    redirect_to :root
  end


  def authenticate_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def sign_in(user)
    session[:user_id] = user.id
    user
  end

end
