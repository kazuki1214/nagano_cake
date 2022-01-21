class ApplicationController < ActionController::Base

  def after_customers_sign_in_for(resource)
    root_path
  end


end
