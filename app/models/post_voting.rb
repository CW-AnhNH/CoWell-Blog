# frozen_string_literal: true

class PostVoting < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :user, optional: true
end
