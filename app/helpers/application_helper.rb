module ApplicationHelper

  def check_username(object)
    object.username ? object.username : object.email
  end

end
