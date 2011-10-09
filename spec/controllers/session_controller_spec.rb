require 'spec_helper'

describe SessionsController do

  before(:each) do
    @mock_user = mock_model(Alumnus)
    @mock_user.should_receive(:id).any_number_of_times.and_return(1)
  end

  it "should setup session for a valid user" do
    Alumnus.should_receive(:authenticate).with("foo", "bar").and_return(@mock_user)
    post(:create, :email => "foo", :password => "bar")
    session[:user_id].should == 1
  end

  it "should put user id into cookie" do
    Alumnus.should_receive(:authenticate).with("foo", "bar").and_return(@mock_user)
    post(:create, :email => "foo", :password => "bar")
    cookies[SessionsController::COOKIE_KEY].should == "1"
  end

  it "should delete session" do
    session[:user_id] = 1
    post :destroy, :id => 1
    session[:user_id].should be_nil
    cookies[SessionsController::COOKIE_KEY].should be_nil
  end
end