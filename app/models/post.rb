class Post < ApplicationRecord
    has_many :comments
    belongs_to :user
    belongs_to :group
end
