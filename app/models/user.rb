class User < ApplicationRecord
  has_many :posts
  #attr_accessor :remember_token
  has_secure_password
  before_create :remember
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  #validates :password, presence: true, length: { minimum: 6 }

  def remember
  	token = SecureRandom.urlsafe_base64
  	self.remember_digest = Digest::SHA1.hexdigest(token.to_s)
  end

end
