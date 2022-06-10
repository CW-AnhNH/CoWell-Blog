class PagesController < ApplicationController
  
  def home
    @users = User.where(admin: false).or(User.where(admin: nil))
  end
end
