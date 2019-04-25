class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
    end
  end

  def delete
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

end
