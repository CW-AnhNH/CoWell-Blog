# frozen_string_literal: true

module Admin
  class DashboardController < Admin::BaseController
    def index
      @post = Post.all
      @user = User.all
      @group = Group.all
    end
  end
end
