class Post < ApplicationRecord
    validates :title, presence: true
    has_many :comments, foreign_key: "user_id"
    belongs_to :user
end
