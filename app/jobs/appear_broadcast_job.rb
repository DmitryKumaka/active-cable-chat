class AppearBroadcastJob < ApplicationJob
  queue_as :default

  def perform(status)
    ActionCable.server.broadcast 'appear_channel', message: status
  end
end
