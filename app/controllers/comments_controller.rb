class CommentsController < ApplicationController
  load_and_authorize_resource 

  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
      SendEmailsWorker.perform_async @comment.id if Rails.env.development?
      flash[:success] = t "user.review.comment.success"
      respond_to do |format|
        format.js
        format.html {redirect_to :back}
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :review_id
  end
end
