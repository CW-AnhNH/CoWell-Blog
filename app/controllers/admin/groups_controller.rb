module Admin
  class GroupsController < Admin::BaseController
    def index
      @groups = Group.all
    end
  end
end
