class AdminController < ApplicationController
  before_filter :administrators_only

  def toggle
    @alumnus = Alumnus.find(params[:alumnus_id])
    raise "Invalid alumnus id" if @alumnus.nil?
    @alumnus.toggle_admin
    @alumnus.save
    respond_with(@alumnus, ALUMNI_OPTIONS)
  end

  private

  def administrators_only
    alumnus = user_from_session
    raise "Must be an administrator" unless alumnus and alumnus.is_admin
  end

  def user_from_session
    user_id = cookies[SessionsController::COOKIE_KEY]
    user_id ? Alumnus.find(user_id) : nil
  end
end