class UserHasExamsController < ApplicationController

  # GET /user_has_exams
  def index
    @user_has_exams = UserHasExam.order(:id)

    render json: @user_has_exams
  end

  # GET /user_has_exams/1
  def show
    @user_has_exam = UserHasExam.find(params[:id])

    render json: @user_has_exam
  end

  # POST /user_has_exams
  def create
    @user_has_exam = UserHasExam.new(user_has_exam_params)

    if @user_has_exam.save
      render json: @user_has_exam, status: :created, location: @user_has_exam
    else
      render json: @user_has_exam.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_has_exams/1
  def update
    @user_has_exam = UserHasExam.find(params[:id])

    if @user_has_exam.update(user_has_exam_params)
      render json: @user_has_exam
    else
      render json: @user_has_exam.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_has_exams/1
  def destroy
    UserHasExam.delete(params[:id])
  end

  private
    def user_has_exam_params
      params.permit(
        :id,
        :user_id,
        :exam_id
      )
    end
end
