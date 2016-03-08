class LikesController < ActionController::Base
  load_and_authorize_resource

  def create
    current_user.likes.create activity_id: params[:activity_id]
    load_user
    load_activities
    respond_to do |format|
      format.html{redirect_to user}
      format.js
    end
  end

  def destroy
    @like.destroy
    load_user
    load_activities
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end

  private
  def likes_params
    params.require(:like).permit :activity_id, :user_id
  end

  def load_activities
    @activities = PublicActivity::Activity.order("created_at desc").
      where owner: @user
  end

  def load_user
    @user = User.find_by id: params[:user_id]
  end
end
