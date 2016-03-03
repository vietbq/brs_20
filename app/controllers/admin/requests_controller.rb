class Admin::RequestsController < ApplicationController
  load_and_authorize_resource
  before_action :load_requests, only: [:index]

  def index
  end

  def show
  end

  def update
    if @request.update_attributes status: true
      RequestMailer.respond_request(@request).deliver_now
      flash[:info] = t "admin.request.email.success"
    else
      flash[:warning] = t "admin.request.email.error"
    end
    redirect_to admin_requests_path
  end

  private
  def load_requests
    @requests = Request.load_requests.paginate page: params[:page]
  end
end
