class BooksController < ApplicationController
  def index
    @books = Book.paginate page: params[:page], per_page: Settings.books.page
  end
end
