require 'googlebooks'

class Book < ApplicationRecord
  has_many :clubs, through: :book_clubs

end
