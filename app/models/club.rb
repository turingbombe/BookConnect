require 'googlebooks'

class Club < ApplicationRecord
  has_many :messages
  has_many :user_clubs
  has_many :users, through: :user_clubs
  belongs_to :book, optional: true
  # has_many :book_clubs
  # has_many :books, through: :book_clubs

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
    self.all.where(status: 'active')
  end

  def self.archived
    self.all.where(status: "archived")
  end

  def club_member?(club)
    club.users.include?(current_user)
  end

  def status_set
    self.set_club_status
  end


  def self.status_update
    Club.all.each do |club|
      club.update_status
    end
  end



end
