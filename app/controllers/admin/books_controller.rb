class Admin::BooksController < ApplicationController
  load_and_authorize_resource

  def index
    @books = Book.paginate page: params[:page], per_page: Settings.books.page
  end

  def new
    @categories = Category.all
  end

  def create
    if @book.save
      flash[:success] = t "flash.admin.book.create_book"
      redirect_to admin_books_path
    else
      render :new
    end
  end

  private
  def book_params
    params.require(:book).permit :title, :content, :author, :publish_date, :number_of_pages, :category_id
  end
end
