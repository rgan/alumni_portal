class AlumniController < ApplicationController
   OPTIONS = {:except => [:encrypted_password, :salt, :email]}

  # POST /alumni
  def create
    @alumnus = Alumnus.create(params[:alumnus])
    Sunspot.commit
    respond_with(@alumnus, OPTIONS)
  end

  def search
    @result = Alumnus.do_search(params[:search_text])
    respond_with(@result, OPTIONS)
  end

end