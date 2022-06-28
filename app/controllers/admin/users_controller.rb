module Admin
  class UsersController < Admin::BaseController
    before_action :get_user, only: %i[show edit update destroy]
    before_action :set_q, only: %i[index]
    
    def index
      @users = @q.result(distinct: true).page(params[:page]).where.not(admin: true)
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
      if @user.update(user_params)
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

    def set_q
      @q = User.ransack(params[:q])
    end

    def get_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:avatar, :username, :email, :birthday, :status, :password,
                                   :password_confirmation)
    end
  end
end
