class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)
    if current_user.permission == "admin"
      admins_path
    end
  end

   def default_url_options
    { host: ENV['HOST'] || 'localhost:3000' }
  end

end
