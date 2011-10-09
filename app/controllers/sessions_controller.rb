class SessionsController < ApplicationController
  COOKIE_KEY = 'alumni_id'

  def index
    @user = session[:user_id] ? Alumnus.find(session[:user_id]) : nil
  end

  def create
    user = Alumnus.authenticate(params[:email], params[:password])
    if user
      cookies[COOKIE_KEY] = user.id
      session[:user_id] = user.id
      respond_with(user)
    else
      raise "Invalid email/password combination!"
    end
  end

  def destroy
    session[:user_id] = nil
    respond_with("")
  end
end