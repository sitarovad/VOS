class User < ApplicationRecord
  has_many :user_films

  validates :name, presence:true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :login, presence:true, length: { maximum: 200 }, format: { with:VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
