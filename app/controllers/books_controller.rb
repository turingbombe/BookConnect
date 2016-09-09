class BooksController < ApplicationController

  def index
  @books = Book.first(5)

  end

  def show
    book=Book.find(params[:id])
    test = GoogleBooks.search(book.title).first
    @book = Book.new(title: test.title, author: test.authors, genre: test.categories, description: test.description)
  end

  def new

  end 

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
