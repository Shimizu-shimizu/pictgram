class Comment < ApplicationRecord
# rails 07 コメント機能　課題
  validates :content, presence: true
  belongs_to :user
  belongs_to :topic, optional: true
end
