class User < ApplicationRecord

  after_update_commit { AppearBroadcastJob.perform_later self }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :vkontakte]

  has_many :rooms, foreign_key: :sender_id
  has_many :messages


  def self.all_except(user)
    where.not(id: user)
  end


  def self.find_for_facebook_oauth access_token

    if user = User.where(uid: access_token.uid, provider: access_token.provider).first
      user
    else
      User.create!(:provider => access_token.provider,
                   :uid => access_token.uid,
                   :username => access_token.extra.raw_info.name,
                   :email => access_token.extra.raw_info.email,
                   :password => Devise.friendly_token[0,20])
    end

  end


  def self.find_for_vkontakte_oauth access_token

    if user = User.where(uid: access_token.uid, provider: access_token.provider).first
      user
    else
      User.create!(:provider => access_token.provider,
                   :uid => access_token.uid,
                   :username => access_token.info.name,
                   :email => access_token.uid+'@vk.com',
                   :password => Devise.friendly_token[0,20])
    end

  end


  def password_required?
    false
  end

end
