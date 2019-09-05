class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save{email.downcase!}
  validates :name,  presence: true,
            length: {maximum: Settings.maximum_length_name}
  validates :email, presence: true,
            length: {maximum: Settings.maximum_length_email},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true,
            length: {minimum: Settings.minimum_length_password}
end
