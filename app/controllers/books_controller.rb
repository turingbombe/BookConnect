class BooksController < ApplicationController

  def index
  # @books = Book.first(5)
    @books = Book.search(params[:search])
  end

  def show
    @book=Book.find(params[:id])
    # test = GoogleBooks.search(book.title).first
    # @book = Book.new(title: test.title, author: test.authors, genre: test.categories, description: test.description)

  end

  def new
    # rendering a partial _new file through Index. Against convention, and using Class instance in the form, versus instance variable. 
  end 

  def create
    @title = params[:book][:title]
    @author = params[:book][:author]
    test = GoogleBooks.search(@title).first 
    if test.title == @title && test.authors == @authors 
    # unable to save book, even with valid title and author. Need to fix this. 
    @book = Book.create(title: test.title, author: test.authors, genre: test.categories, description: test.description)
      if @book.save
        redirect_to book_path(@book)
      else
        render 'new' 
        "This book title is nonsense, please check the book's title and try again."
      end
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
