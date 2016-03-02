class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.paginate page: params[:page],
      per_page: Settings.users.users_per_page
    get_activities
  end
  
  def show
  end

  private
  def get_activities
    @activities = PublicActivity::Activity.order("created_at desc").
      where owner: current_user
  end
end
