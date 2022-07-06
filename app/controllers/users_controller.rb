# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :get_user, only: %i[show follow unfollow]
  def index
    @users = User.where.not(admin: true)
  end

  def show
    @public_posts = @user.posts.where(privacy: 'publics', status: 'approveds')
    @private_posts = @user.posts.where(privacy: 'privates', status: 'approveds')
    @pending_posts = @user.posts.where(status: 'pendings')
  end

  def follow
    current_user.followeds << @user
    redirect_to user_path(@user)
  end

  def unfollow
    current_user.followed_users.find_by(followed_id: @user.id).destroy
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :username, :email, :birthday, :status, :first_name, :last_name)
  end
end
