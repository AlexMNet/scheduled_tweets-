class TwitterAccount < ApplicationRecord
  belongs_to :user

  # Prevents there from being duplicate twitter_account records
  validates :username, uniqueness: true
end
