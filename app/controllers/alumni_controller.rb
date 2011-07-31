class AlumniController < ApplicationController

  respond_to :json

  # POST /alumni
  def create
    @alumnus = Alumnus.create(params[:alumnus])
    respond_with(@alumnus)
  end

  def search
    @result = Alumnus.doSearch(params[:search_text])
    respond_with(@result)
  end

end