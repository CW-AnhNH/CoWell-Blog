class User < ApplicationRecord
    validates :family_name, :email, presence: true
    has_many :posts, :comments
    belongs_to :group
end
