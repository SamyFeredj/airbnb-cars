class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    cars_path  # Redirige vers la liste des voitures après connexion
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path  # Redirige vers la page d'accueil après déconnexion
  end

  private

  # dans le cours on donne ça mais ça ne marche pas va savoir pourquoi
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def devise_controller?
    is_a?(Devise::SessionsController) || is_a?(Devise::RegistrationsController) || is_a?(Devise::PasswordsController)
  end
end
