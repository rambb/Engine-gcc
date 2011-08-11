module SessionsHelper
  def get_user(user_id)
     @userx = User.find(user_id)
  end
end
