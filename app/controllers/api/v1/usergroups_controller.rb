class Api::V1::UsergroupsController < ApplicationController
  before_action :set_usergroup, only: [:show, :update, :destroy]

  # GET /api/v1/groups/:group_id/subgroups/:subgroup_id/usergroups
  def index
    @usergroups = Api::V1::Usergroup.where(subgroup_id: params[:subgroup_id])

    render json: @usergroups
  end


  # GET /api/v1/groups/:group_id/subgroups/:subgroup_id/usergroups/1
  def show
    render json: @usergroup
  end

  # POST /api/v1/groups/:group_id/subgroups/:subgroup_id/usergroups
  def create
    @usergroup = Api::V1::Usergroup.new(usergroup_params)

    if @usergroup.save
      render json: @usergroup, status: :created, location: @usergroup
    else
      render json: @usergroup.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/groups/:group_id/subgroups/:subgroup_id/usergroups/1
  def update
    if @usergroup.update(usergroup_params)
      render json: @usergroup
    else
      render json: @usergroup.errors, status: :unprocessable_entity
    end
  end
 

  # DELETE /api/v1/groups/:group_id/subgroups/:subgroup_id/usergroups/1
  def destroy
    @usergroup.destroy

  end

  private

  def set_assignment
    @usergroup = Api::V1::Usergroup.find(params[:id])
  end

  def usergroup_params
    params.require(:usergroup).permit(:api_v1_user_id, :api_v1_subgroup_id)
  end

end
