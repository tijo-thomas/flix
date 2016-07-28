class User < ActiveRecord::Base
  has_many :favorites, dependent: :destroy
  has_many :favorite_movies, through: :favorites, source: :movie
  has_many :reviews, dependent: :destroy
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true,
  									format: { with: /\A\S+@\S+\z/ },
  									uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 10, allow_blank: true } # The 'allow_blank: true' is important since a password isn't required when a user updates his name and/or email. Also, the :password is a virtual attribute since the database column is password_digest.
  validates :username, presence: true,
  											format: { with: /\A[A-Z0-9]+\z/i },
  											uniqueness: { case_sensitive: false }

 	# Passes in the email and password parameters to find
 	# the user and then calls the authenticate method
 	# provided by has_secure_password
  def self.authenticate(email, password)
  	user = User.find_by(email: email)
  	user && user.authenticate(password)
  end
end