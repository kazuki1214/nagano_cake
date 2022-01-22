class ApplicationController < ActionController::Base
  before_action :config_permitted_parameters, if: :devise_controller?

  def after_admins_sign_in_for(resource)
    admin_root_path
  end

  def after_customers_sign_in_for(resource)
    root_path
  end

  protected

  def config_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end

end
