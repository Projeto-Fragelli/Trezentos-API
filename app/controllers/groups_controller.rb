class GroupsController < ApplicationController

  # GET /groups
  def index
    @groups = Group.order(:id)

    render json: @groups
  end

  # GET /groups/1
  def show
    @group = Group.find(params[:id])
    render json: @group
  end

  # POST /groups
  def create
    @group = Group.new(group_params)

    if @group.save
      render json: @group, status: :created, location: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/1
  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groups/1
  def destroy
    Group.delete(params[:id])
  end

  private
    def group_params
      params.permit(
        :id,
        :number,
        :exam_id
      )
    end
end
