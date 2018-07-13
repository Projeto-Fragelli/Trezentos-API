class UserHasGroupsController < ApplicationController

  # GET /user_has_groups
  def index
    @user_has_groups = UserHasGroup.order(:id)

    render json: @user_has_groups
  end

  # GET /user_has_groups/1
  def show
    @user_has_group = UserHasGroup.find(params[:id])

    render json: @user_has_group
  end

  # POST /user_has_groups
  def create
    @user_has_group = UserHasGroup.new(user_has_group_params)

    if @user_has_group.save
      render json: @user_has_group, status: :created, location: @user_has_group
    else
      render json: @user_has_group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_has_groups/1
  def update
    @user_has_group = UserHasGroup.find(params[:id])

    if @user_has_group.update(user_has_group_params)
      render json: @user_has_group
    else
      render json: @user_has_group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_has_groups/1
  def destroy
    UserHasGroup.delete(params[:id])
  end

  private
    def user_has_group_params
      params.permit(
        :id,
        :grade,
        :user_id,
        :group_id,
        :helper
      )
    end
end
