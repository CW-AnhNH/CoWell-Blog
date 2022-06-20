# frozen_string_literal: true

class PostsController < ApplicationController
    before_action :get_post, only: %i[show edit update destroy]
  
    def index
      @posts = Post.all
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
  
    private
  
    def post_params
      params.require(:post).permit(:title, :content)
    end
  end
  