require 'spec_helper'


describe AdminController do

  before(:each) do
    mock_admin = mock_model(Alumnus)
    Alumnus.should_receive(:find).with(2).and_return(mock_admin)
    mock_admin.should_receive(:is_admin).and_return(true)
    session[:user_id] = 2

    @mock_alumnus = mock_model(Alumnus)
    Alumnus.should_receive(:find).with("1").and_return(@mock_alumnus)
  end

  it "should make user admin" do
    @mock_alumnus.should_receive(:make_admin)
    @mock_alumnus.should_receive(:to_json).and_return("{result}")
    post(:create, :format => :json, :alumnus_id => '1')
  end

  it "should remove user as admin" do
    @mock_alumnus.should_receive(:remove_admin)
    delete(:delete, :format => :json, :alumnus_id => '1')
  end

end
