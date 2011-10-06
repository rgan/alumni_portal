require 'spec_helper'


describe Alumnus do

  it "should not be valid if any field is null" do
    alumnus = Alumnus.new
    alumnus.valid?.should be_false
  end

  it "should be valid if all fields have values" do
    alumnus = FactoryGirl.build(:alumnus)
    alumnus.valid?.should be_true
  end

  it "should not allow dynamic fields" do
    begin
      alumnus = FactoryGirl.build(:alumnus)
      alumnus.foo = "bar"
      fail("should have thrown exception")
    rescue NoMethodError
    end
  end

  it "should not be valid if all address fields are not valid" do
    alumnus = FactoryGirl.build(:alumnus)
    alumnus.address = Address.new
    alumnus.valid?.should be_false
  end

  it "should not require maiden_name" do
    alumnus = FactoryGirl.build(:alumnus)
    alumnus.valid?.should be_true
  end

  it "should not be valid if first_name has non-alpha characters" do
    alumnus = FactoryGirl.build(:alumnus)
    alumnus.first_name = '1'
    alumnus.valid?.should be_false
  end

  it "is_admin should return true if admin" do
    alumnus = FactoryGirl.build(:admin)
    alumnus.is_admin.should be_true
  end

  it "should not be admin by default" do
    alumnus = FactoryGirl.build(:alumnus)
    alumnus.is_admin.should be_false
  end

  it "make_admin should work" do
    alumnus = FactoryGirl.build(:alumnus)
    alumnus.make_admin
    alumnus.is_admin.should be_true
  end

  it "should no longer be admin after remove_admin" do
    alumnus = FactoryGirl.build(:admin)
    alumnus.remove_admin
    alumnus.is_admin.should be_false
  end

end