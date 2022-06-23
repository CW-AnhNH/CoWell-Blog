class UsersController < ApplicationController
    before_action :get_user, only: %i[show edit update destroy]
    def index
      @users = User.where.not(admin: true)
    end

    def show; end

    def new
      @user = User.new
    end

    def create
    end

    def edit; end

    def update
    end

    def destroy
    end

    private


    def user_params
      params.require(:user).permit(:avatar, :username, :email, :birthday, :status, :password,
                                   :password_confirmation)
    end
  end
end