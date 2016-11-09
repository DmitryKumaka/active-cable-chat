class RoomsController < ApplicationController
  before_filter :authenticate_user!

  def create
    if Room.between(params[:sender_id],params[:recipient_id]).present?
      @room = Room.between(params[:sender_id],params[:recipient_id]).first
    else
      @room = Room.create!(conversation_params)
    end

    redirect_to action: 'show', id: @room.id
  end

  def show
    @room = Room.find(params[:id])
    @reciever = reverse(@room)
    @messages = @room.messages
    @message = Message.new
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  def reverse(room)
    current_user == room.recipient ? room.sender : room.recipient
  end
end