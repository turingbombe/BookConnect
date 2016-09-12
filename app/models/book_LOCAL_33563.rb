require 'googlebooks'

class Book < ApplicationRecord
  has_many :clubs

  def book_details
  books ||= GoogleBooks.search(self.title)
  @book = books.first
  end

  def thumbnail
    book_details.image_link(:zoom => 5)
  end

  def cover_image
    book_details.image_link(:zoom => 2)
  end


end
