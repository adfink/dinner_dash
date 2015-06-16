class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true, confirmation: true
  validates :display_name, length: { in: 2..32 }, allow_blank: true
  # validates :email_confirmation, presence: true
  # validates_confirmation_of :email
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
