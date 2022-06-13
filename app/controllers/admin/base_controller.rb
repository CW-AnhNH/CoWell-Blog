# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    layout "admin_layout"
    before_action :check_admin_permission

    private

    def check_admin_permission
      redirect_to root_path unless current_user.admin?
    end
  end
end
