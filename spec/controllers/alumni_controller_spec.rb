require 'spec_helper'


describe AlumniController do

  it "should invoke create model with params on post" do
    mock_alumnus = mock_model(Alumnus)
    mock_alumnus.should_receive(:to_json).and_return("{result}")
    Alumnus.should_receive(:create).with('{"first_name":"test"}').and_return(mock_alumnus)
    Sunspot.should_receive(:commit)
    post(:create, :format => :json, :alumnus => '{"first_name":"test"}')
    response.body.should == "{result}"
  end

  it "should invoke doSearch on model with params on post" do
    mock_alumnus = mock(Alumnus)
    Alumnus.should_receive(:doSearch).with('search_text').and_return([mock_alumnus])
    get :search, :search_text => 'search_text'
  end

end