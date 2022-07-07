# frozen_string_literal: true

class Group < ApplicationRecord
  validates :name, presence: true
  paginates_per 20
  belongs_to :user, optional: true
  has_many :posts, dependent: :destroy
  has_many :group_members
  has_many :members, through: :group_members, source: :user

  enum :privacy, { publics: 0, privates: 1 }
end
