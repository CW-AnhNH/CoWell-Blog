class Post < ApplicationRecord
    validates :title, presence: true
    has_many :comments
    belongs_to :group, optional: true
    belongs_to :user
end
