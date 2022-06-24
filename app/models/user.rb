class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         has_many :followed_users, foreign_key: :follower_id, class_name: 'Relationship'
         has_many :followees, through: :followed_users
         has_many :following_users, foreign_key: :followed_id, class_name: 'Relationship'
         has_many :followers, through: :following_users
     
end
