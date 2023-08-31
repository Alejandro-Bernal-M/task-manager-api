class Api::V1::SubgroupsController < ApplicationController
  before_action :set_subgroup, only: [:show, :update, :destroy]

  # GET /api/v1/:user_id/groups/:group_id/subgroups
  def index
    @subgroups = Subgroup.where(group_id: params[:group_id])

    render json: @subgroups
  end
  
  # GET /api/v1/:user_id/groups/:group_id/subgroups/1
  def show
    render json: {data:{subgroup: @subgroup, users: @subgroup.users.map{ |user| {id: user.id ,email: user.email, name: user.name} }}}
  end

  # POST /api/v1/:user_id/groups/:group_id/subgroups
  def create
    @subgroup = Subgroup.new(subgroup_params)

    if @subgroup.save
      render json:{ data: @subgroup, status: 'SUCCESS'}
    else
      render json: @subgroup.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/:user_id/groups/:group_id/subgroups/1
  def update
    if @subgroup.update(subgroup_params)
      render json: @subgroup
    else
      render json: @subgroup.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/:user_id/groups/:group_id/subgroups/1
  def destroy
    if @subgroup.destroy
      render json: { data: @subgroup, status: 'SUCCESS', message: 'Subgroup was successfully deleted.'}
    else
      render json: @subgroup.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subgroup
      @subgroup = Subgroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subgroup_params
      params.require(:subgroup).permit(:title, :description, :group_id)
    end
end
