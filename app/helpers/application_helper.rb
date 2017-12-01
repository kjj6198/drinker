module ApplicationHelper
  def auth_google_user!
    if !current_user && !request.xhr? == 0
      
      redirect_to user_google_oauth2_omniauth_authorize_path
    end
  end
end
