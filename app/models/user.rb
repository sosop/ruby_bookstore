class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation,:remember_token
  has_secure_password
  before_save :create_remember_token_and_downcase_email


  validates :name, presence: true, length: {minimum: 4,maximum: 15}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,presence: true, format: {with:VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private
    def create_remember_token_and_downcase_email
      self.remember_token = SecureRandom.urlsafe_base64
      self.email = email.downcase
    end
end
