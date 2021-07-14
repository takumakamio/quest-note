class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true

  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :quests, dependent: :destroy
  has_many :lists, dependent: :destroy

  attachment :image
end
