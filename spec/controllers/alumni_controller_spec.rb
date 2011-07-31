require 'spec_helper'


describe AlumniController do

  it "should invoke create model with params on post" do
    mock_alumnus = mock(Alumnus)
    Alumnus.stub!(:create).with('{"first_name":"test"}').and_return(mock_alumnus)
    post :create, :alumnus => '{"first_name":"test"}'
  end

  it "should invoke doSearch on model with params on post" do
    mock_alumnus = mock(Alumnus)
    Alumnus.stub!(:doSearch).with('search_text').and_return([mock_alumnus])
    get :search, :search_text => 'search_text'
  end

end