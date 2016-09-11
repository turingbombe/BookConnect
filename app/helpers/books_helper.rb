module BooksHelper

  # def image_url(book)
  #   url ||= GoogleBooks.search(book.title).first.image_link
  #   if url
  #     url
  #   else
  #     url = "book.jpg"
  #   end
  # end

  # def larger_image(book)
  #   image_url(zoom: 2)
  # end

  def image_url(book, zoom)
    url ||= GoogleBooks.search(book.title).first.image_link(:zoom=> zoom)
    if url
      url
    else
      url = "book.jpg"
    end
  end

end
