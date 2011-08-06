require 'spec_helper'

describe "address" do

  it "should not be valid if city field is null" do
    address = Address.new :country => "usa"
    address.valid?.should be_false
  end

  it "should not be valid if country field is null" do
    address = Address.new :city => "new york"
    address.valid?.should be_false
  end

  it "should be valid if all fields have values" do
    address = Address.new :city => "new york", :country => "usa"
    address.valid?.should be_true
  end
end