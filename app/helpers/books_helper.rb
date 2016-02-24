module BooksHelper
  def get_image book
    image_url = book.image.present? ? book.image : Settings.books.url
    image_tag = "<img src=#{image_url} width=#{Settings.books.detail_width}
      class='book-detail-shadow' >"
    image_tag.html_safe
  end
end
