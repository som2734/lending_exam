class Lender < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :fname, :lname, :money, :presence => true
  validates :email, :presence => true, :format => { :with => EMAIL_REGEX }, :uniqueness => { :case_sensitive => false }
  validates :money, numericality: { greater_than: 0 }
  has_many :histories
  has_many :borrowers, through: :histories
end
