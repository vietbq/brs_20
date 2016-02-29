module BooksHelper
  def get_image book
    image_url = book.image.present? ? book.image : Settings.books.url
    image_tag = "<img src=#{image_url} width=#{Settings.books.detail_width}
      class='book-detail-shadow' >"
    image_tag.html_safe
  end

  def load_mark_button_class book
    load_reading book.marked_reading?(current_user), book
    load_read book.marked_read?(current_user), book
    load_favorite book.marked_favorite?(current_user), book
  end

  ["reading", "read", "favorite"].each do |action|
    define_method("load_#{action}") do |check, book|
        instance_variable_set "@class_#{action}", 
          check ? "btn-marked-#{action}" : "btn-#{action}"
        instance_variable_set "@#{action}_method", check ? :delete : :post
        if action == "favorite"
          object = check ? book.load_marked_favorite(current_user) : book.favorites.build
        else
          object = check ? book.load_marked_book(current_user) : book.user_books.build
        end
        instance_variable_set "@#{action}", object
    end
  end
end
