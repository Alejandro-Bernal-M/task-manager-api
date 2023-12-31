class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
  skip_before_action :authenticate_request, only: [:create, :index]

  # GET /api/v1/users
  def index
    @users = User.all

    render json: {data: @users, status: 'SUCCESS', message: 'Loaded users'}
  end

  # GET /api/v1/users/1
  def show
    render json: {data: @user, status: 'SUCCESS', message: 'Loaded user'}
  end

  # POST /api/v1/users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: {status: 'SUCCESS', message: 'User created', data: @user}
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1
  def update
    if @user.update(user_params)
      render json: {status: 'SUCCESS', message: 'User updated', data: @user}
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
