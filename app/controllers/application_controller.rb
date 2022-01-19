class ApplicationController < ActionController::Base


  def after_admin_sign_in_path_for(resource)
    admin_root_path
  end

  def after_sign_in_for(resource)
    root_path
  end


end
