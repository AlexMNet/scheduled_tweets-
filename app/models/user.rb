# email:string
# password_digest:string

# VIrtuals added by has_secure_pass
# password:string virtual
# password_confirmation: string virtual
class User < ApplicationRecord
  has_many :twitter_accounts
  has_many :tweets
  # virtual that creats hashed password and saves that in the database
  has_secure_password

  validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "Must be a valid email"}
end

