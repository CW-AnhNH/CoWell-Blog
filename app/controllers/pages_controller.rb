# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @users = User.where.not(admin: true)
  end
end
