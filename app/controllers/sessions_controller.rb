class SessionsController < ApplicationController
  include SessionManager

  before_filter :load_user, only: [:create]

  def create
    if @user.try(:authenticate, params[:session][:password])
      log_in(@user)
    else
      log_out
      access_denied and return
    end
    @user
  end

  def destroy
    log_out
  end

  private

  def load_user
    @user = User.find_by(email: params[:session][:email])
  end
end