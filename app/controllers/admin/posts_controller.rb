# frozen_string_literal: true

module Admin
  class PostsController < Admin::BaseController
    before_action :set_post, only: %i[show edit update destroy]
    before_action :set_q, only: %i[index]

    def index
      @q = Post.ransack(params[:q])
      @posts = @q.result.includes(:user).page(params[:page])
      @group = Group.all
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params.merge(user_id: current_user.id))

      if @post.save
        redirect_to admin_posts_path
      else
        render 'new'
      end
    end

    def show; end

    def update
      if @post.update(post_params)
        redirect_to admin_posts_path
      else
        render 'edit'
      end
    end

    def edit
      @q = @post.comments.ransack(params[:q])
      @comments = @q.result.includes(:user).page(params[:page])
    end

    def destroy
      @post.destroy

      redirect_to admin_posts_path
    end

    private

    def set_q
      @q = Post.includes(:user, :group, :comments, :post_votings).ransack(params[:q])
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :privacy, :group_id, :user_id, :status)
    end
  end
end
