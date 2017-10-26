module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname, :phone, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :lastname, :phone, :avatar])
  end

end

DeviseController.send :include, DevisePermittedParameters