class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :prepare_exception_notifier
  before_action :authenticate_user!
  before_action :premit_custom_parameter, if: :devise_controller?

  def after_sign_in_path_for(resource)
    url_for(resource.class.new)
  end

  protected

  def prepare_exception_notifier
    request.env["exception_notifier.exception_data"] = {
      current_user: current_user
    }
  end

  def premit_custom_parameter
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :type])
  end
end
