# frozen_string_literal: true

class Post < ApplicationRecord

  paginates_per 1
  has_many :comments
  belongs_to :user, optional: true
  belongs_to :group, optional: true


  validates :title, presence: true, length: { maximum: 500 }
  validates :content, presence: true, length: { maximum: 2000 }
end
