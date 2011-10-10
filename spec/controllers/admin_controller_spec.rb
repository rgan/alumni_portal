require 'spec_helper'


describe AdminController do

  before(:each) do
    mock_admin = mock_model(Alumnus)
    Alumnus.should_receive(:find).with(2).and_return(mock_admin)
    mock_admin.should_receive(:is_admin).and_return(true)
    @request.cookies[SessionsController::COOKIE_KEY] = 2

    @mock_alumnus = mock_model(Alumnus)
    Alumnus.should_receive(:find).with("1").and_return(@mock_alumnus)
  end

  it "should toggle admin" do
    @mock_alumnus.should_receive(:toggle_admin)
    @mock_alumnus.should_receive(:save)
    @mock_alumnus.should_receive(:to_json).and_return("{result}")
    post(:toggle, :format => :json, :alumnus_id => '1')
  end

end
