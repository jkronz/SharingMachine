class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def current_user
    @_current_user ||= User.find_by(id: session[:user_id])
  end

  def render_errors(obj)
    @errors = obj.errors.full_messages
    render 'errors/error', status: 422
  end

  def access_denied
    @errors = ["Access Denied"]
    render 'errors/error', status: 403
  end

  def not_found
    @errors = ["Not Found"]
    render 'errors/error', status: 404
  end
end
