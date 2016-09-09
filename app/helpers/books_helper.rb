module BooksHelper
 
  def image_url(book)
    url ||= GoogleBooks.search(book.title).first.image_link
    if url
      url
    else
      url = "book.jpg"
    end
  end

end
