class Api::V1::TasksController < ApplicationController
  before_action :set_task, only: %i[ show update destroy ]

  # GET /api/v1/users/:user_id/tasks
  def index
    @tasks = Task.includes(:assignments).where(author_id: params[:user_id]).order(:order)
    @tasks_organized = @tasks.map{|task| {
      description: task.description,
      id: task.id,
      order: task.order,
      status: task.status,
      subgroup_id: task.subgroup_id,
      title: task.title,
      author_id: task.author_id,
      assigneds: task.assignments
      }}
      
      @assignments = Assignment.where(user_id: params[:user_id])
      @assigned_tasks = []
      @assignments.each { |assignment| @assigned_tasks.push(Task.find(assignment.task_id))}
  
      @assigned_tasks_organized = @assigned_tasks.map{|task| {
        description: task.description,
        id: task.id,
        order: task.order,
        status: task.status,
        subgroup_id: task.subgroup_id,
        title: task.title,
        author_id: task.author_id,
        assigneds: task.assignments
        }}


    render json: {authored: @tasks_organized, assigned: @assigned_tasks_organized}
  end

  # GET /api/v1/users/:user_id/tasks/:id
  def show
    render json: @task
  end

  # POST /api/v1/users/:user_id/tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      @task.update(order: @task.id)
      render json: @task, status: :created
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
    render json: {message: 'Task deleted'}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description, :status, :author_id, :order, :subgroup_id)
    end
end
