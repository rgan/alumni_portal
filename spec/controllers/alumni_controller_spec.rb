require 'spec_helper'


describe AlumniController do

  before(:each) do
     @mock_alumnus = mock_model(Alumnus)
  end

  it "should invoke create model with params on post" do
    @mock_alumnus.should_receive(:to_json).and_return("{result}")
    Alumnus.should_receive(:create).with('{"first_name":"test"}').and_return(@mock_alumnus)
    Sunspot.should_receive(:commit)
    post(:create, :format => :json, :alumnus => '{"first_name":"test"}')
    response.body.should == "{result}"
  end

  it "should invoke doSearch on model with params on post" do
    Alumnus.should_receive(:do_search).with('search_text').and_return([@mock_alumnus])
    get :search, :search_text => 'search_text'
  end

  it "should invoke delete on model" do
    Alumnus.should_receive(:find).with(1).and_return(@mock_alumnus)
    @mock_alumnus.should_receive(:delete)
    Sunspot.should_receive(:remove).with(@mock_alumnus)
    Sunspot.should_receive(:commit)
    post :destroy, :id => 1
  end

end