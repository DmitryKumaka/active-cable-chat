class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save!

    redirect_to controller: 'rooms', action: 'show', id: @room.id

  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end