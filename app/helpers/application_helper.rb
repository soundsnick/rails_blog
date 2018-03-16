module ApplicationHelper
  def check_auth
    session[:current_user_email] ? true : false
  end

  def check_admin
    session[:current_user_email] && session[:current_user_email] == 'soundsnick@gmail.com' ? true : false
  end
end
