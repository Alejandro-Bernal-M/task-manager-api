class Api::V1::AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :update, :destroy]

  # GET /api/v1/users/:user_id/assignments
  def index
    @assignments = Api::V1::Assignment.where(api_v1_user_id: params[:user_id])

    render json: @assignments
  end

  # GET /api/v1/users/:user_id/tasks/:task_id/assignments/:id
  def show
    render json: @assignment
  end

  # POST /api/v1/users/:user_id/tasks/:task_id/assignments
  def create
    @assignment = Api::V1::Assignment.new(assignment_params)

    if @assignment.save
      render json: @assignment, status: :created
    else
      render json: @assignment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/:user_id/tasks/:task_id/assignments/:id
  def update
    if @assignment.update(assignment_params)
      render json: @assignment
    else
      render json: @assignment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/:user_id/tasks/:task_id/assignments/:id
  def destroy
    @assignment.destroy
    head :no_content
  end

  private

  def set_assignment
    @assignment = Api::V1::Assignment.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:api_v1_user_id, :api_v1_task_id)
  end
end
