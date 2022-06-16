# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments
  belongs_to :user, :group
end
