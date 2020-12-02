class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :add_default_avatar, on: [:create, :update]
  include Pundit

  #meta-tags
  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :avatar]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def add_default_avatar
    if user_signed_in?
      unless current_user.avatar.attached?
        current_user.avatar.attach(
          io: File.open(
            Rails.root.join(
              'app', 'assets', 'images', 'default_avatar.png'
            )
          ), filename: 'default_avatar.png',
          content_type: 'image/png'
        )
      end
    end
  end
end
