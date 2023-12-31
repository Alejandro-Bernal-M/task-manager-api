class Api::V1::AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :update, :destroy]

  # GET /api/v1/users/:user_id/assignments
  def index
    @assignments = Assignment.where(user_id: params[:user_id])

    render json: @assignments
  end

  # GET /api/v1/users/:user_id/tasks/:task_id/assignments/:id
  def show
    render json: @assignment
  end

  # POST /api/v1/users/:user_id/tasks/:task_id/assignments
  def create
    @assignment = Assignment.new(assignment_params)
    if Assignment.exists?(user_id: @assignment.user_id, task_id: @assignment.task_id)
      render json: {status: 'ERROR', message: 'Assignation alredy exists'}, status: :unprocessable_entity
    elsif @assignment.save
      render json: {data: @assignment, status: 'SUCCESS', message: 'User assigned'}, status: :created
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
   if @assignment.destroy
    render json: {status: 'SUCCESS', message: 'Assignation deleted'}
   else 
    render json: {status: 'ERROR', message: 'Assignation not deleted'}
   end
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:user_id, :task_id)
  end
end
