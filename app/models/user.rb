class User < ActiveRecord::Base
  has_secure_password
  has_many :contacts
  has_many :messages
  validates :first_name, :last_name, :email, presence: true
  validates :password, :length => { :minimum => 5, allow_nil: true }
end
