# frozen_string_literal: true

module Admin
  class PostsController < Admin::BaseController
    before_action :get_post, only: %i[show edit update destroy]
    before_action :set_q, only: %i[index search]

    def index
      @posts = Post.page(params[:page]).all
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

    def edit; end

    def destroy
      @post.destroy

      redirect_to admin_posts_path
    end

    def search
      @results = @q.result(distinct: true)
    end

    private

    def set_q
      @q = Post.ransack(params[:q])
    end

    private

    def post_params
      params.require(:post).permit(:title, :content)
    end
  end
end
