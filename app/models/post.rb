# frozen_string_literal: true

class Post < ApplicationRecord
  has_one_attached :image

  paginates_per 5
  has_many :comments, dependent: :destroy
  has_many :post_votings, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :group, optional: true

  validates :title, presence: true, length: { maximum: 500 }
  validates :content, presence: true, length: { maximum: 2000 }

  enum :privacy, { publics: 0, privates: 1 }
  enum :status, { pendings: 0, approveds: 1, rejects: 2 }

  scope :public_posts, -> { where(privacy: 'publics', status: 'approveds') }
  scope :private_posts, -> { where(privacy: 'privates', status: 'approveds') }
  scope :pending_posts, -> { where(status: 'pendings') }

  scope :latest, -> { order('created_at DESC') }

  scope :week, -> { where('created_at >= ?', Time.now.advance(weeks: -1)).order('created_at ASC') }
  scope :month, -> { where('created_at >= ?', Time.now.advance(months: -1)).order('created_at ASC') }
  scope :year, -> { where('created_at >= ?', Time.now.advance(years: -2)).order('created_at ASC') }
end
