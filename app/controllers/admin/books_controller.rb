class Admin::BooksController < ApplicationController
  load_and_authorize_resource
  before_action :load_categories, only: [:new, :edit]

  def index
    @books = Book.paginate page: params[:page], per_page: Settings.books.page
  end

  def new
  end

  def create
    if @book.save
      flash[:success] = t "flash.admin.book.create_book"
      redirect_to admin_books_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update_attributes book_params
      flash[:success] = t "admin.books.updated_success"
      redirect_to [:admin, @book]
    else
      render :edit
    end
  end

  def destroy
    if @book.destroy
      flash[:success] = t "admin.books.destroy-success"
    else
      flash[:alert] = t "admin.books.destroy-fail"
    end
    redirect_to [:admin, @book]
  end

  private
  def load_categories
    @categories = Category.all
  end

  def book_params
    params.require(:book).permit :title, :content, :author, :publish_date, :number_of_pages, :category_id
  end
end
