class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    @search = Book.search params[:q]
    @books = @search.result(distinct: true).paginate page: params[:page],
      per_page: Settings.books.page
  end

  def show
    if @book.nil?
      flash[:error] = t "flash.user.not_found_book"
      redirect_to root_path
    else
      load_reviews
    end
  end

  private
  def load_reviews
    @reviews = @book.reviews
  end
end
