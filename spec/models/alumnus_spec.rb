require 'spec_helper'


describe Alumnus do

  it "should not be valid if any field is null" do
    alumnus = Alumnus.new
    alumnus.valid?.should be_false
  end

  it "should be valid if all fields have values" do
    alumnus = Alumnus.new :first_name => "f", :last_name => "l", :maiden_name => "m",
                          :ug_college => "ug", :pg_college => "pg", :specialty => "surgery"
    alumnus.valid?.should be_true
  end

  it "should not allow dynamic fields" do
    begin
      alumnus = Alumnus.new Alumnus.new :first_name => "f", :last_name => "l", :maiden_name => "m",
                                        :ug_college => "ug", :pg_college => "pg", :specialty => "surgery", :foo => "bar"
      fail()
    rescue NoMethodError
    end
  end

  it "should not require maiden_name" do
    alumnus = Alumnus.new :first_name => "f", :last_name => "l",
                          :ug_college => "ug", :pg_college => "pg", :specialty => "surgery"
    alumnus.valid?.should be_true
  end

  it "should not be valid if first_name has non-alpha characters" do
    alumnus = Alumnus.new :first_name => "1", :last_name => "l", :maiden_name => "m",
                          :ug_college => "ug", :pg_college => "pg", :specialty => "surgery"
    alumnus.valid?.should be_false
  end

end