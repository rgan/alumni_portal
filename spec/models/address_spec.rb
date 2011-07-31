require 'spec_helper'

describe "address" do

  it "should not be valid if any field is null" do
    address = Address.new
    address.valid?.should be_false
  end

  it "should be valid if all fields have values" do
    address = Address.new  :city => "new york", :state => "new york", :country => "usa"
    address.valid?.should be_true
  end
end