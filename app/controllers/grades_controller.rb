class GradesController < ApplicationController
 
  # GET /grades
  def index
    @grades = Grade.order(:id)

    render json: @grades
  end

  # GET /grades/1
  def show
    @grade = Grade.find(params[:id])

    render json: @grade
  end

  # POST /grades
  def create
    @grade = Grade.new(grade_params)

    if @grade.save
      render json: @grade, status: :created, location: @grade
    else
      render json: @grade.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /grades/1
  def update
    @grade = Grade.find(params[:id])

    if @grade.update(grade_params)
      render json: @grade
    else
      render json: @grade.errors, status: :unprocessable_entity
    end
  end

  # DELETE /grades/1
  def destroy
    Grade.delete(params[:id])
  end

  private
    def grade_params
      params.permit(
        :id,
        :grade,
        :user_id,
        :exam_id,
        :grade_type_id
      )
    end
end
