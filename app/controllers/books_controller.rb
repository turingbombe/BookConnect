class BooksController < ApplicationController

  def index
    @books = Book.search(params[:search])
    @booksapi = GoogleBooks.search(params[:search]).first(3)
  end

  def show
    @book=Book.find(params[:id])
  end

  def new
  end

  def create
    test = GoogleBooks.search(params[:book_id]).first
    @book = Book.new(title: test.title, author: test.authors, genre: test.categories, description: test.description, url: test.image_link)
      if @book.save
        redirect_to book_path(@book)
      else
        "This book title is nonsense, please check the book's title and try again."
      end
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def book_params
    params.require(:book).permit(:title, :author)
  end

end
