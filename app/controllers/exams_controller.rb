class ExamsController < ApplicationController
 
  # GET /exams
  def index
    @exams = Exam.order(:id)

    render json: @exams
  end

  # GET /exams/1
  def show
    @exam = Exam.find(params[:id])

    render json: @exam
  end

  # POST /exams
  def create
    @exam = Exam.new(exam_params)

    if @exam.save
      render json: @exam, status: :created, location: @exam
    else
      render json: @exam.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exams/1
  def update
    @exam = Exam.find(params[:id])

    if @exam.update(exam_params)
      render json: @exam
    else
      render json: @exam.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exams/1
  def destroy
    Exam.delete(params[:id])
  end

  private
    def exam_params
      params.permit(
        :id,
        :description,
        :classroom_id
      )
    end
end
