class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :group
    belongs_to :post
    has_many :active_relationship, foreign_key: "user_id", "post_id"
end
