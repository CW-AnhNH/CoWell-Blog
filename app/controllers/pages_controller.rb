class PagesController < ApplicationController
  def home
    @users = User.all # except admin user
  end
end
