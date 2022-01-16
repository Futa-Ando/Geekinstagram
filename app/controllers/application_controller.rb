class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :image, :depth1, :depth2, :depth3, :depth4, :depth5, :depth6, :depth7, :depth8, :depth9, :depth10, :depth11, :depth12])
    end
end