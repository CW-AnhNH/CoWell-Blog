# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :must_be_admin, only: %i[edit update destroy]

  # GET /groups or /groups.json
  def index
    # @groups = Group.all
    @q = Group.ransack(params[:q])
    @groups = @q.result.includes(:user)
    @user = User.all
    if current_user.admin?
      render 'index'
    else
      render 'list_for_user'
    end
  end

  def index_for_user
    @q = Group.ransack(params[:q])
    @groups = @q.result
  end

  # GET /groups/1 or /groups/1.json
  def show; end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups or /groups.json
  def create
    # @group = Group.new(group_params)
    @group = current_user.groups.build(group_params)
    respond_to do |format|
      # @user = current_user
      if @group.save
        format.html { redirect_to group_url(@group), notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :description, :privacy).merge(user_id: current_user.id)
  end

  def must_be_admin
    unless current_user.id == @group.user_id || current_user.admin?
      redirect_to root_path, notice: 'Not the creator of this group!'
    end
  end
end
