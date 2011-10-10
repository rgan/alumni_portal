class SessionsController < ApplicationController
  COOKIE_KEY = 'alumni_id'

  def index
    @user = cookies[COOKIE_KEY] ? Alumnus.find(cookies[COOKIE_KEY]) : nil
    @username = @user.nil? ? "" :@user.first_name
    @is_admin = @user.nil? ? false : @user.is_admin
  end

  def create
    user = Alumnus.authenticate(params[:email], params[:password])
    if user
      cookies[COOKIE_KEY] = user.id
      session[:user_id] = user.id
      puts session[:user_id]
      respond_with(user)
    else
      raise "Invalid email/password combination!"
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.delete(COOKIE_KEY)
    respond_with("")
  end
end