class Api::V1::SubgroupController < ApplicationController
  before_action :set_api_v1_subgroup, only: [:show, :update, :destroy]

  # GET /api/v1/:user_id/groups/:group_id/subgroups
  def index
    @api_v1_subgroups = Api::V1::Subgroup.where(group_id: params[:group_id])

    render json: @api_v1_subgroups
  end
  
  # GET /api/v1/:user_id/groups/:group_id/subgroups/1
  def show
    render json: @api_v1_subgroup
  end

  # POST /api/v1/:user_id/groups/:group_id/subgroups
  def create
    @api_v1_subgroup = Api::V1::Subgroup.new(api_v1_subgroup_params)

    if @api_v1_subgroup.save
      render json: @api_v1_subgroup, status: :created, location: @api_v1_subgroup
    else
      render json: @api_v1_subgroup.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/:user_id/groups/:group_id/subgroups/1
  def update
    if @api_v1_subgroup.update(api_v1_subgroup_params)
      render json: @api_v1_subgroup
    else
      render json: @api_v1_subgroup.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/:user_id/groups/:group_id/subgroups/1
  def destroy
    @api_v1_subgroup.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_subgroup
      @api_v1_subgroup = Api::V1::Subgroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_subgroup_params
      params.require(:api_v1_subgroup).permit(:title, :description, :group_id)
    end
end
