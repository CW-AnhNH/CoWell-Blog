# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @users = User.all
  end
end
