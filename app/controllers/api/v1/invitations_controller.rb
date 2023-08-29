class Api::V1::InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :update, :destroy]

  def index
    @invitations = Invitation.includes(:author, :subgroup).where(user_id: params[:user_id])
    @invitations_send_by_you = Invitation.includes(:author, :subgroup).where(author_id: params[:user_id])
    @filtered_invitations_send_by_you = @invitations_send_by_you.map  do |invitation|
      data = {
        subgroup: Subgroup.find(invitation.subgroup_id).title,
        invited: {name: User.find(invitation.user_id).name, email: User.find(invitation.user_id).email},
        date: invitation.created_at,
        status: invitation.status,
        id: invitation.id
      }
      data
    end
    @filtered_invitations = @invitations.map  do |invitation| 
      data = {
        subgroup: Subgroup.find(invitation.subgroup_id).title,
        invited_by: {name: User.find(invitation.author_id).name, email: User.find(invitation.author_id).email}, 
        date: invitation.created_at,
        status: invitation.status,
        id: invitation.id
      }
      data
    end
    render json: {data: {received: @filtered_invitations, send: @filtered_invitations_send_by_you}  , status: 'SUCCESS'}
  end

  def show
    render json: {data: @invitation, status: 'SUCCESS'}
  rescue ActiveRecord::RecordNotFound
    render json: {status: 'ERROR', message: 'Invitation not found'}
  end

  def create
    @invitation = Invitation.new(invitation_params)
    
    if Invitation.exists?(user_id: @invitation.user_id, subgroup_id: @invitation.subgroup_id)
      render json: { status: 'ERROR', message: 'Invitation already exists' }
    elsif @invitation.save
      render json: { data: @invitation, status: 'SUCCESS', message: 'Invitation created' }
    else
      render json: { status: 'ERROR', message: 'Invitation not created' }
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
    params.require(:invitation).permit(:user_id, :group_id, :author_id, :status)
  end

end