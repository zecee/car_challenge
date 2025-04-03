class User < ApplicationRecord
  has_secure_password

  has_many :favorites
  has_many :cars, through: :favorites

  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
