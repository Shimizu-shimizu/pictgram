class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  
  has_many :favorites 
  has_many :favorite_users, through: :favorites, source: 'user'
  # rails 07 コメント機能　課題
  has_many :comments
end