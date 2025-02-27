class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?

  def after_sign_in_path_for(resource)
    cars_path  # Redirige vers la liste des voitures après connexion
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path  # Redirige vers la page d'accueil après déconnexion
  end

  private

  def devise_controller?
    is_a?(Devise::SessionsController) || is_a?(Devise::RegistrationsController) || is_a?(Devise::PasswordsController)
  end
end

