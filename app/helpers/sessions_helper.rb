module SessionsHelper

  #cookies created using the session method are automatically encrypted, no way for outsider to log in as the user
  def log_in(user)
    session[:user_id] = @user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

end
