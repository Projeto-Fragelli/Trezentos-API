class ClassroomsController < ApplicationController
  # GET /classrooms
  def index
    @classrooms = Classroom.order(:id)

    render json: @classrooms
  end

  # GET /classrooms/1
  def show
    @classroom = Classroom.find(params[:id])

    render json: @classroom
  end

  # POST /classrooms
  def create
    @classroom = Classroom.new(classroom_params)

    if @classroom.save
      render json: @classroom, status: :created, location: @classroom
    else
      render json: @classroom.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /classrooms/1
  def update
    @clasroom = Classroom.find(params[:id])

    if @classroom.update(classroom_params)
      render json: @classroom
    else
      render json: @classroom.errors, status: :unprocessable_entity
    end
  end

  # DELETE /classrooms/1
  def destroy
    Classroom.delete(params[:id])
  end

  private
    def classroom_params
      params.permit(
        :id,
        :user_id,
        :name,
        :password,
        :password_confirmation,
        :institution,
        :cut_off,
        :description
      )
    end
end
