class Api::V1::InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :update, :destroy]

  def index
    @invitations = Invitation.where(user_id: params[:user_id])
    render json: {data: @invitations.map { |invitation| subgroup: Subgroup.find(invitation.subgroup_id), invited_by: User.find(invitation.author_id), date: inivitation.created_at} , status: 'SUCCESS'}
  end

  def show
    render json: {data: @invitation, status: 'SUCCESS'}
  rescue ActiveRecord::RecordNotFound
    render json: {status: 'ERROR', message: 'Invitation not found'}
  end

  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      render json: {data: @invitation, status: 'SUCCESS', message: 'Invitation created'}
    else
      render json: {status: 'ERROR', message: 'Invitation not created'}
    end
  end

  def update
    if @invitation.update(invitation_params)
      render json: {data: @invitation, status: 'SUCCESS', message: 'Invitation updated'}
    else
      render json: {status: 'ERROR', message: 'Invitation not updated'}
    end
  end

  def destroy
    if @invitation.destroy
      render json: {data: @invitation, status: 'SUCCESS', message: 'Invitation deleted'}
    else
      render json: {status: 'ERROR', message: 'Invitation not deleted'}
    end
  end

  private

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end

  def invitation_params
    params.require(:invitation).permit(:user_id, :group_id, :author_id)
  end

end