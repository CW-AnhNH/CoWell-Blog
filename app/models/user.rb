# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  extend Devise::Models

  paginates_per 10
  has_many :comments, dependent: :destroy
  has_many :post_votings, dependent: :destroy
  has_many :posts,  dependent: :destroy
  has_many :groups, dependent: :destroy

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Relationship'
  has_many :followeds, through: :followed_users
  has_many :following_users, foreign_key: :followed_id, class_name: 'Relationship'
  has_many :followers, through: :following_users

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  validates :email, presence: true
  has_many :posts

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      # user.full_name = auth.info.name # assuming the user model has a name
      # user.avatar_url = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  before_save { self.email = email.downcase }
  validates :username, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  has_one_attached :avatar

  validates :avatar, file_size: { less_than_or_equal_to: 5.megabytes },
                     file_content_type: { allow: ['image/jpeg', 'image/png', 'image/gif'] }
  validate :birthday_cannot_be_in_the_future
  def birthday_cannot_be_in_the_future
    errors.add(:birthday, "can't be in the past") if birthday.present? && birthday > Date.today
  end

  def self.search(search)
    where('username LIKE :query OR email LIKE :query', { query: "%#{search}%" })
  end

  def self.status(status)
    where('status LIKE :query', { query: "%#{status}%" })
  end

  enum :status, { permit: 0, ban: 1 }
end
