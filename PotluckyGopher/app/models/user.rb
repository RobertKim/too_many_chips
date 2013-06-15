class User < ActiveRecord::Base
  attr_accessible :name, :email, :password
  has_many :events, :class_name => 'Event', :foreign_key => 'user_id'
  has_secure_password
  validates :name, :length  => {:minimum => 2, :too_short  => "must have at least %{count} letters"}
  validates :email, :uniqueness => {:case_sensitive => false, :message => "has already been taken"}, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,:message    => "must be a valid format" }
  validates :password, :length => {:minimum => 6, :too_short  => "must have at least %{count} characters"}
  validates_confirmation_of :password

end

