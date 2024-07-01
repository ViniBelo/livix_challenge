class User < ApplicationRecord
  has_one :user_detail, dependent: :destroy
  accepts_nested_attributes_for :user_detail
  has_secure_password

  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+\z/

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: "must be a valid email address!" }, uniqueness: true
end
