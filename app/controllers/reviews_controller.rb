class ReviewsController < ApplicationController
  def create
    @new_review = current_user.reviews.build review_params
    if @new_review.save
      flash[:success] = t "reviews.messages.success"
    else
      flash[:warning] = t "reviews.messages.fail"
    end
    redirect_to @new_review.book
  end 

  private
  def review_params
    params.require(:review).permit :user_id, :book_id, :title, :content, :rate
  end
end
