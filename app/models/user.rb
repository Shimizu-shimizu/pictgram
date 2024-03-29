class User < ApplicationRecord
  
  # rails 04 課題
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{8,32}+\z/
  validates :password, presence: true,
  length: { minimum: 8, maximum: 32},
  format: { with: VALID_PASSWORD_REGEX}
  
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  
  validates :name, presence: true,
  length: { maximum: 15}
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  # rails07 コメント機能　課題
  has_many :comments
end
