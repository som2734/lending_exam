class Borrower < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :f_name, :l_name, :funds, :purpose, :description, :presence => true
  validates :email, :presence => true, :format => { :with => EMAIL_REGEX }, :uniqueness => { :case_sensitive => false }
  has_many :histories
  has_many :lenders, through: :histories
end
