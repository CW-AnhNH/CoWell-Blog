# frozen_string_literal: true

class User < ApplicationRecord
  extend Devise::Models

  paginates_per 2
  has_many :posts,  dependent: :destroy
  has_many :groups, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
