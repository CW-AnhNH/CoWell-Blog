# frozen_string_literal: true

class Api::PostsController < Api::BaseController
  def index
    posts = current_user.search_posts(params[:title])
    @total_pages = posts.size
    @posts = posts.page(params[:page]).per(params[:per_page])
  end
end

def test
  100.times do
    Group.all.sample.id
    Post.create({
      user_id: 1,
      title: Faker::Book.title,
      content: Faker::Quote.matz,
      group_id: Group.all.sample.id
    })
  end
end