# frozen_string_literal: true

module Admin
  class UsersController < Admin::BaseController
    before_action :get_user, only: %i[show edit update destroy]
    def index
      @users = User.where.not(admin: true)
      @users = if params[:search]
                 @users.search(params[:search])
               else
                 @users.all
               end
    end

    def show; end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = 'User successfully created'
        redirect_to admin_users_path
      else
        render 'new'
      end
    end

    def edit; end

    def update
      if @user.update_attributes(user_params)
        redirect_to admin_users_path
      else
        render 'edit'
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path
    end

    private

    def user_params
      params.require(:user).permit(:avatar, :username, :email, :birthday, :password,
                                   :password_confirmation)
    end
  end
end
