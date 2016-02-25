class UsersController < ApplicationController
  load_and_authorize_resource

  def index
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
