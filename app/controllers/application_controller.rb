class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ↓ログインしないと自動的にログインページで飛ぶ ↓
  # before_action :authenticate_user!

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [
        :nickname,
        :image_url,
        :profile,
        :family_name,
        :first_name,
        :ja_family_name,
        :ja_first_name,
        :birthday,
        :authenticate_phone]
    )  
  end
end
