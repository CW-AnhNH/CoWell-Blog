# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :must_be_admin, only: %i[edit update destroy]

  def index
    @q = Group.ransack(params[:q])
    @groups = @q.result.includes(:user).page(params[:page])
  end

  def show; end

  def new
    @group = Group.new
  end

  def edit; end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to group_url(@group), notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to group_url(@group), notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy

    redirect_to groups_url, notice: 'Group was successfully destroyed.'
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :description, :privacy).merge(user_id: current_user.id)
  end

  def must_be_admin
    unless current_user.id == @group.user_id || current_user.admin?
      redirect_to root_path, notice: 'Not the creator of this group!'
    end
  end
end
