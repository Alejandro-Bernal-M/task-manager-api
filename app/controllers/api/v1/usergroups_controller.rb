class Api::V1::UsergroupsController < ApplicationController
  before_action :set_assignment, only: [:show, :update, :destroy]

  # GET /api/v1/users/:user_id/usergroups
  def index
    @usergroups = Usergroup.where(user_id: params[:user_id])
    @data = @usergroups.map { |usergroup| {subgroup: Subgroup.find(usergroup.subgroup_id), assignation_id: usergroup.id} }
    @subgroups =  @data

    render json: {data: @subgroups, status: 'SUCCESS'}
  end


  # GET /api/v1/users/:user_id/usergroups/:id
  def show
    render json: @usergroup
  end

  # POST /api/v1/users/:user_id/usergroups/:id
  def create
    @usergroup = Usergroup.new(usergroup_params)

    if Usergroup.exists?(user_id: @usergroup.user_id, subgroup_id: @usergroup.subgroup_id)
      render json: { status: 'ERROR', message: 'Assignation already exists' }
    elsif @usergroup.save
      render json:{ data: @usergroup, status: 'SUCCESS', message: 'Assigned to the group'}
    else
      render json: { data: @usergroup.errors, status: 'ERROR', message: 'Not assigned to the group'}
    end
  end

  # PATCH/PUT /api/v1/users/:user_id/usergroups/:id
  def update
    if @usergroup.update(usergroup_params)
      render json: @usergroup
    else
      render json: @usergroup.errors, status: :unprocessable_entity
    end
  end
 

  # DELETE /api/v1/users/:user_id/usergroups/:id
  def destroy
    if @usergroup.destroy
      render json: {message: 'Assignation deleted', status: 'SUCCESS'}
    else 
      render json: {message: 'Something went wrong', status: 'ERROR'}
    end
  end

  private

  def set_assignment
    @usergroup = Usergroup.find(params[:id])
  end

  def usergroup_params
    params.require(:usergroup).permit(:user_id, :subgroup_id)
  end

end
