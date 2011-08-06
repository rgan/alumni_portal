class Address
  include Mongoid::Document
  field :city, :type => String
  field :country, :type => String

  validates_format_of :city, :country, :with => /[A-Za-z]/
  validates_length_of :city, :country, :minimum => 1, :maximum => 100
end