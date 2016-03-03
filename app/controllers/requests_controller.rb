class RequestsController < ApplicationController
  load_and_authorize_resource
  before_action :load_requests, only: [:index]

  def index
  end

  def new
  end

  def create
    if @request.save
      flash[:success] = t "user.request.success"
    else
      flash[:warning] = t "user.request.error"
    end
    render :new
  end

  def destroy
    @request.destroy
    flash[:success] = t "user.request.cancel"
    redirect_to requests_path
  end

  private
  def request_params
    params.require(:request).permit :user_id, :book_name, :author, :content, :url
  end

  def load_requests
    @requests = current_user.requests.order created_at: :desc
  end
end
