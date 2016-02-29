class UserBooksController < ApplicationController
  load_and_authorize_resource
  def create
    @book = Book.find_by id: params[:book_id]
    check_request_type @book, params[:status].to_i
    respond_to do |format|
      format.html{redirect_to @book}
      format.js
    end
  end

  def destroy
    @book = Book.find_by id: params[:book_id]
    @user_book.destroy
    respond_to do |format|
      format.html{redirect_to @book}
      format.js
    end
  end

  private
  def check_request_type book, status
    case status
    when Settings.books.marked_book.reading
      mark_reading book
    else
      mark_read book
    end
  end

  def mark_reading book
    if book.marked_read? current_user
      flash[:warning] = t "flash.user.book.marked_read_message"
    else
      marked_book book, Settings.books.marked_book.reading
    end
  end

  def mark_read book
    if book.marked_read? current_user
      book.destroy_marked_book current_user
    else
      book.destroy_marked_book current_user if book.marked_reading? current_user
      marked_book book, Settings.books.marked_book.read
    end
  end

  def marked_book book, status
    book.user_books.create user: current_user, status: status
  end
end
