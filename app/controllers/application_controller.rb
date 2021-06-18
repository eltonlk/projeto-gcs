require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [ :name ])
      devise_parameter_sanitizer.permit(:sign_up       , keys: [ :name ])
    end
end
