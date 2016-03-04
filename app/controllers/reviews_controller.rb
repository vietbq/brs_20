class ReviewsController < ApplicationController
  load_and_authorize_resource

  def create
    @new_review = current_user.reviews.build review_params
    if @new_review.save
      flash[:success] = t "reviews.messages.success"
    else
      flash[:warning] = t "reviews.messages.fail"
    end
    redirect_to @new_review.book
  end 

  def edit
  end

  def update
    if @review.update_attributes review_params
      flash[:success] = t "user.review.success"
      redirect_to @review.book
    else
      flash[:warning] = t "user.review.error"
      render :edit
    end
  end

  def destroy
    if @review.destroy
      flash[:success] = t "user.review.destroy.success"
    else
      flash[:error] = t "user.review.destroy.fail"
    end
    redirect_to @review.book
  end

  private
  def review_params
    params.require(:review).permit :user_id, :book_id, :title, :content, :rate
  end
end
