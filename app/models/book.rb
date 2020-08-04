class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  validates :title, length: { maximum: 50 }
  validates :body, length: { maximum: 50 }
end
