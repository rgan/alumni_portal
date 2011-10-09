class Alumnus
  include Mongoid::Document

  field :first_name, :type => String
  field :encrypted_password, :type => String
  field :salt, :type => String
  field :maiden_name, :type => String
  field :last_name, :type => String
  field :ug_college, :type => String
  field :pg_college, :type => String
  field :specialty, :type => String
  field :email, :type => String
  field :sub_specialty, :type => String
  field :admin, :type => Boolean
  attr_accessor :password

  embeds_one :address

  include Sunspot::Mongoid
  searchable do
    text :first_name, :last_name, :maiden_name, :ug_college, :pg_college, :specialty, :sub_specialty
    text :city do
      address.nil? ? nil : address.city
    end
  end

  validates_format_of :email, :with => /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/
  validates_format_of :first_name, :last_name, :ug_college, :pg_college, :specialty, :with => /[A-Za-z]/
  validates_length_of :first_name, :last_name, :ug_college, :pg_college, :specialty, :minimum => 1, :maximum => 100
  validates_length_of :maiden_name, :sub_specialty, :maximum => 100
  validates_length_of :password, :minimum => 6, :maximum => 12
  validates_associated :address

  before_save :encrypt_password

  def self.do_search(search_text)
    @search = Alumnus.search() do
      keywords(search_text)
    end
    @search.results
  end

  def self.authenticate(email, pwd)
    @alumnus = Alumnus.find(:all, :conditions => { :email => email }).first
    @alumnus.encrypted_password == encrypt(pwd, @alumnus.salt) ? @alumnus : nil
  end

  def make_admin()
    self.admin = true
  end

  def remove_admin()
    self.admin = false
  end

  def is_admin()
     self.admin
  end

  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  private

  def encrypt_password
    return if password.blank?
    self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{self.email}--") if new_record?
    self.encrypted_password = self.class.encrypt(password,salt)
  end

end