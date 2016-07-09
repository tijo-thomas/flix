class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true,
  									format: { with: /\A\S+@\S+\z/ },
  									uniqueness: { case_sensitive: false }
end