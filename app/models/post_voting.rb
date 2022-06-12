# frozen_string_literal: true

class PostVoting < ApplicationRecord
  belongs_to :post
  belongs_to :user
end
