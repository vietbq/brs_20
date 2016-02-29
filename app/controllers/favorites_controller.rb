class FavoritesController < ApplicationController
  load_and_authorize_resource
  before_action :load_favorites, only: [:index]

  def index
  end

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

  private
  def load_favorites
    @favorites = current_user.favorites.paginate(page: params[:page]).
      limit Settings.favorite.limit
  end
end
