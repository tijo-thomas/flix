class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true,
  									format: { with: /\A\S+@\S+\z/ },
  									uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 10, allow_blank: true } # The 'allow_blank: true' is important since a password isn't required when a user updates his name and/or email. Also, the :password is a virtual attribute since the database column is password_digest.
end