class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  has_secure_password
  has_many :contacts
  has_many :messages
  validates :first_name, :last_name, :email, presence: true
  validates :password, presence: true, :length => { :minimum => 5, allow_nil: true }
end
