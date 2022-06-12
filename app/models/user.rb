class User < ApplicationRecord
  validates :family_name, :email, presence: true
  has_many :posts
  has_many :comments
  belongs_to :group, optional: true
end
