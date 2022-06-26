# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    before_action :check_admin_permission

    private

    def check_admin_permission
      # redirect_to root_path unless current_user.admin?
    end

    def get_user
      @user = User.find(params[:id])
    end
  end
end
