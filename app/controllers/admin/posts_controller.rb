# frozen_string_literal: true

module Admin
  class PostsController < Admin::BaseController
    before_action :set_post, only: %i[show edit update destroy]

    def index
      @q = Post.ransack(params[:q])
      @posts = @q.result.includes(:user).page(params[:page])
    end

    def show; end

    def new
      @post = Post.new
    end

    def edit
      @q = @post.comments.ransack(params[:q])
      @comments = @q.result.includes(:user).page(params[:page])
    end

    def create
      @post = Post.new(post_params)

      if @post.save
        redirect_to post_url(@post), notice: 'Post was successfully created.'
      else
        render :new
      end
    end

    def update
      if @post.update(post_params)
        redirect_to admin_post_url(@post), notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @post.destroy

      redirect_to admin_posts_url, notice: 'Post was successfully destroyed.'
    end

    private

    def set_post
      @post = Post.find_by(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :privacy, :group_id, :user_id)
    end
  end
end
