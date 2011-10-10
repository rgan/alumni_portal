class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :json
  ALUMNI_OPTIONS = {:except => [:encrypted_password, :salt, :email]}
end
