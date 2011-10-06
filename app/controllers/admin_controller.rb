class AdminController < ApplicationController
  before_filter :administrators_only

  def create
    @alumnus = Alumnus.find(params[:alumnus_id])
    @alumnus.make_admin if @alumnus
    respond_with(@alumnus)
  end

  def delete
    @alumnus = Alumnus.find(params[:alumnus_id])
    @alumnus.remove_admin if @alumnus
    respond_with(@alumnus)
  end

  private

  def administrators_only
    alumnus = user_from_session
    raise "Must be an administrator" unless alumnus and alumnus.is_admin
  end

  def user_from_session
    session[:user_id] ? Alumnus.find(session[:user_id]) : nil
  end
end