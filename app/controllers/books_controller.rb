class BooksController < ApplicationController

  def show
    book=Book.find(params[:id])
    test = GoogleBooks.search(book.title).first
    @book = Book.new(title: test.title, author: test.authors, genre: test.categories, description: test.description)
  end

end
