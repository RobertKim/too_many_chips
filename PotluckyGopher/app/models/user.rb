class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password_digest, :username

  has_many :events
end
