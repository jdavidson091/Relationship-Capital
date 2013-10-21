class User < ActiveRecord::Base
  #callback to downcase email before storing it in db
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  #validate name
  validates :name, presence: true, length: { maximum: 50 }

  # a user email should exist, have the correct regex format, should be unique,
  # and shouldn't be case sensitive
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  #ensure the user has a secure password... a little bit magic here
  # Adds password and password_confirmation attributes
  # require the presence of the password
  # require that they match
  # add an authenticate method to compare encrypted password to the password_digest
  has_secure_password
  # ^ works as long as there is a password_digest column in the database

  #make sure password length is at least 6 characters
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
