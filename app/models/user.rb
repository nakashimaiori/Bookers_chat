class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  attachment :profile_image
  validates :introduction, presence: false, length: { maximum: 50 }
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }

  # チャット用
  has_many :chats, dependent: :destroy
  has_many :user_rooms, dependent: :destroy
end
