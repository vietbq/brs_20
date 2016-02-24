class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception
  include CanCan::ControllerAdditions

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = t "access_denied"
    redirect_to root_url
  end
end
