# frozen_string_literal: true

class Group < ApplicationRecord
  
  validates :name, presence: true
  paginates_per 5
  belongs_to :user
  has_many :posts
  has_many :group_members
  has_many :members, through: :group_members, source: :user

  # enum :privacy, %i(private public)
end
