class Message < ApplicationRecord

  after_create_commit { ChatBroadcastJob.perform_later self }

  belongs_to :room
  belongs_to :user

  validates_presence_of :content, :room_id, :user_id



end
