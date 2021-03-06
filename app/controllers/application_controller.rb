class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

        def after_sign_in_path_for(resource)
            posts_path
        end

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:fname, :lname, :email, :password, :dob) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:fname, :lname, :email, :password, :current_password, :dob) }
        end

end
