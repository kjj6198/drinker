class Users::OauthCallbacksController < ApplicationController
  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      flash[:notice] = "Sorry, 請用sudo email帳戶登入"
      redirect_to root_path
    end
  end

  def failure

  end
end
