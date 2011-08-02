class Alumnus
  include Mongoid::Document

  field :first_name, :type => String
  field :maiden_name, :type => String
  field :last_name, :type => String
  field :ug_college, :type => String
  field :pg_college, :type => String
  field :specialty, :type => String

  embeds_one :address

  include Sunspot::Mongoid
  searchable do
    text :first_name #, :last_name, :maiden_name, :ug_college, :pg_college, :specialty
  end

  validates_format_of :first_name, :last_name, :ug_college, :pg_college, :specialty, :with => /[A-Za-z]/
  validates_length_of :first_name, :last_name, :ug_college, :pg_college, :specialty, :minimum => 1, :maximum => 100
  validates_length_of :maiden_name, :maximum => 100

  def self.doSearch(search_text)
    @search = Alumnus.search() do
      keywords(search_text)
    end
    @search.results
  end

end