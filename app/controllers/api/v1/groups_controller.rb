class Api::V1::GroupsController < ApplicationController
  before_action :set_group, only: %i[ show update destroy ]

  # GET /api/v1/users/:user_id/groups
  def index
    @groups = Group.where(author_id: params[:user_id]).includes(:subgroups)

    render json: {status: 'SUCCESS', data: @groups.map { |group| {group: group, subgroups: group.subgroups} }}
  end

  # GET /api/v1/groups/1
  def show
    render json: @group
  end

  # POST /api/v1/groups
  def create
    @group = Group.new(group_params)

    if @group.save
      render json: {data: @group, status: 'SUCCESS'}
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/groups/1
  def update
    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/groups/1
  def destroy
    if @group.destroy
      render json: {status: 'SUCCESS', message: 'Deleted the group', data: @group} 
    else
      render json: {status: 'ERROR', message: 'Failed to delete the group', data: @group.errors}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:title, :description, :author_id)
    end
end

