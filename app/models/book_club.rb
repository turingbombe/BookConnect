class BookClub < ApplicationRecord
  belongs_to :book, optional: true
  belongs_to :club, optional: true
end
