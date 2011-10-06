class AlumniController < ApplicationController

  # POST /alumni
  def create
    @alumnus = Alumnus.create(params[:alumnus])
    Sunspot.commit
    respond_with(@alumnus)
  end

  def search
    @result = Alumnus.do_search(params[:search_text])
    respond_with(@result)
  end

end