class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def remember(user)
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_digest] = user.remember_digest
  end

  def log_out
    #forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end



end
