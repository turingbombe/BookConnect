require 'googlebooks'

class Book < ApplicationRecord
  has_many :clubs, through: :book_clubs

def index 
@books = Book.all
end


end
