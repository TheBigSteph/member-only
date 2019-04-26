class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to posts_url
    end
  end

  def delete
    log_out
    redirect_to posts_url
  end

end
