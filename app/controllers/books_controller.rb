class BooksController < ApplicationController
  load_and_authorize_resource  except: :show

  def index
    @search = Book.search params[:q]
    @books = @search.result(distinct: true).paginate page: params[:page],
      per_page: Settings.books.page
  end

  def show
    @book = Book.find_by id: params[:id]
    if @book.nil?
      flash[:warning] = t "flash.user.not_found_book"
      redirect_to books_path
    else
      load_reviews
      @new_review = current_user.reviews.build
      @reviews = @book.reviews.paginate page: params[:page],
        per_page: Settings.reviews.page
    end
  end

  private
  def load_reviews
    @reviews = @book.reviews
  end
end
