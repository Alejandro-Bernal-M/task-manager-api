class Api::V1::TasksController < ApplicationController
  before_action :set_task, only: %i[ show update destroy ]

  # GET /api/v1/users/:user_id/tasks
  def index
    @tasks = Task.where(author_id: params[:user_id])

    render json: @tasks
  end

  # GET /api/v1/tasks/1
  def show
    render json: @task
  end

  # POST /api/v1/tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/tasks/1
  def destroy
    @task.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :content, :status, :author_id)
    end
end
