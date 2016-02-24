class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  
  before_action :authenticate_user!

  hide_action :current_user

  protect_from_forgery with: :exception
  include CanCan::ControllerAdditions

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = t "access_denied"
    redirect_to root_url
  end
end
