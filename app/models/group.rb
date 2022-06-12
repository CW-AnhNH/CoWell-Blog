# frozen_string_literal: true

class Group < ApplicationRecord
	belongs_to :user
  has_many :posts
  has_many :group_members
  has_many :members, through: :group_members, source: :user
end
