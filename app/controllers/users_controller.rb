class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.paginate page: params[:page],
      per_page: Settings.users.users_per_page
  end
  
  def show
    load_favorites
    @reading = load_user_books 0
    @read = load_user_books 1
    load_activities
  end

  private
  def load_activities
    @activities = PublicActivity::Activity.order("created_at desc").
      where owner: @user
  end

  def load_favorites
    @favorites = @user.favorites.paginate page: params[:page],
      per_page: Settings.favorite.limit
  end

  def load_user_books status
    current_user.user_books.load_user_books status
  end
end
