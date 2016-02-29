class FavoritesController < ApplicationController
  load_and_authorize_resource
  def create
    @book = Book.find_by id: params[:book_id]
    @book.favorites.create user: current_user
    respond_to do |format|
      format.html{redirect_to @book}
      format.js
    end
  end

  def destroy
    @book = @favorite.book
    @favorite.destroy
    respond_to do |format|
      format.html{redirect_to @book}
      format.js
    end
  end
end
