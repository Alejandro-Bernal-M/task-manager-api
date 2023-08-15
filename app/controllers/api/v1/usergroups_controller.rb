class Api::V1::UsergroupsController < ApplicationController
  before_action :set_usergroup, only: [:show, :update, :destroy]

  # GET /api/v1/users/:user_id/usergroups
  def index
    @usergroups = Usergroup.where(user_id: params[:user_id])
    @subgroups = @usergroups.map { |usergroup| Subgroup.find(usergroup.subgroup_id) }

    render json: {data: @subgroups, status: 'SUCCESS'}
  end


  # GET /api/v1/users/:user_id/usergroups/:id
  def show
    render json: @usergroup
  end

  # POST /api/v1/users/:user_id/usergroups/:id
  def create
    @usergroup = Usergroup.new(usergroup_params)

    if @usergroup.save
      render json: @usergroup, status: :created, location: @usergroup
    else
      render json: @usergroup.errors, status: :unprocessable_entity
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
    @usergroup.destroy

  end

  private

  def set_assignment
    @usergroup = Usergroup.find(params[:id])
  end

  def usergroup_params
    params.require(:usergroup).permit(:user_id, :subgroup_id)
  end

end
