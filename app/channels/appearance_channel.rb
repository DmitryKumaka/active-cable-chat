class AppearanceChannel < ApplicationCable::Channel

  def subscribed
    stream_from "appear_channel"
  end

  def unsubscribed
    disappear
  end

  def appear
    user = User.find(current_user.id)
    user.update(appear: true)
  end

  def disappear
    user = User.find(current_user.id)
    user.update(appear: false)
  end

end
