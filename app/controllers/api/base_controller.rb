# frozen_string_literal: true

class Api::BaseController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :set_user_by_token
  skip_before_action :authenticate_user!
end
