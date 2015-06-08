module ApplicationHelper
  protected
  
  def current_user
  	session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def authenticate_user!
  	redirect_to login_path unless current_user
  end
end
