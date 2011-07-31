class Address
  include Mongoid::Document
  field :city, :type => String
  field :state, :type => String
  field :country, :type => String

  validates_format_of :city, :state, :country, :with => /[A-Za-z]/
  validates_length_of :city, :state, :country, :minimum => 1, :maximum => 100
end