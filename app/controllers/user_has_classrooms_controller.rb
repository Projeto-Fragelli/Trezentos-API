class UserHasClassroomsController < ApplicationController

  # GET /user_has_classrooms
  def index
    @user_has_classrooms = UserHasClassroom.order(:id)

    render json: @user_has_classrooms
  end

  # GET /user_has_classrooms/1
  def show
    @user_has_classroom = UserHasClassroom.find(params[:id])
    render json: @user_has_classroom
  end

  # POST /user_has_classrooms
  def create
    @user_has_classroom = UserHasClassroom.new(user_has_classroom_params)

    if @user_has_classroom.save
      render json: @user_has_classroom, status: :created, location: @user_has_classroom
    else
      render json: @user_has_classroom.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_has_classrooms/1
  def update
    @user_has_classroom = UserHasClassroom.find(params[:id])

    if @user_has_classroom.update(user_has_classroom_params)
      render json: @user_has_classroom
    else
      render json: @user_has_classroom.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_has_classrooms/1
  def destroy
    UserHasClassroom.delete(params[:id])
  end

  private
    def user_has_classroom_params
      params.permit(
        :id,
        :user_id,
        :classroom_id,
        :user_type_id
      )
    end
end
