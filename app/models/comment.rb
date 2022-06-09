class Comment < ApplicationRecord
    belongs_to : user, post, group
    has_many : active_relationship, foreign_key: "user_id", "post_id"
end
