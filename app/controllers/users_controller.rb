class UsersController < ApplicationController

  def index
    get_activities
  end

  private
  def get_activities
    @activities = PublicActivity::Activity.order("created_at desc").
      where owner: current_user
  end
end
