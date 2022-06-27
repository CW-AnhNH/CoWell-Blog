# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :posts,  dependent: :destroy

  belongs_to :user, optional: true

  enum :privacy, { publics: 0, privates: 1 }
end
