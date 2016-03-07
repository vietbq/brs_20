class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.paginate page: params[:page],
      per_page: Settings.users.users_per_page
  end
  
  def show
    load_favorites
    load_activities if @user == current_user
  end

  private
  def load_activities
    @activities = PublicActivity::Activity.order("created_at desc").
      where owner: current_user
  end

  def load_favorites
    @favorites = @user.favorites.paginate page: params[:page],
      per_page: Settings.favorite.limit
  end
end
