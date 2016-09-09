require 'googlebooks'

class Club < ApplicationRecord
  has_many :messages
  has_many :user_clubs
  has_many :users, through: :user_clubs
  belongs_to :book, optional: true

  has_many :books, through: :book_clubs

  accepts_nested_attributes_for :messages


  # Club status:
  # 'upcoming' = Book club starting in the near future
  # 'open' = Book club has started but you can still register
  # 'closed' = Book club is active but you cannot join
  # 'archived' = Book club has ended
  def self.upcoming
    self.all.where(status: 'upcoming')
  end

  def self.open
    self.all.where(status: 'open')
  end

  # def club_member?
  #   self.users.include?(current_user)
  # end


end
