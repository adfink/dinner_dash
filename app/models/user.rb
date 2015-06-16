class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true, confirmation: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
