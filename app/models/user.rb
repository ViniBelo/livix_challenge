class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+\z/
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: "Must be a valid email address!" }
end
