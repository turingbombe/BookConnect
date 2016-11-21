require 'googlebooks'

class Club < ApplicationRecord
  has_many :messages
  has_many :user_clubs
  has_many :users, through: :user_clubs
  belongs_to :book, optional: true

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
    self.all.where(status: 'archived')
  end

  def club_member?(club)
    club.users.include?(current_user)
  end

  def set_status
    now = Date.today
    if self.end_date.past?
      self.status = 'archived'
    elsif self.start_date <= now
      self.status = 'active'
    elsif (now - self.start_date) > 10
      self.status = 'closed'
    elsif (self.start_date) > now
      self.status = 'upcoming'
    end
    self.save
  end

  def self.update_status
    now = Date.today
    Club.all.each do |club|
      if club.status == 'closed' && club.end_date.past?
        club.status = 'archived'
      elsif club.status == 'upcoming' && club.start_date <= now
        club.status = 'active'
      elsif club.status == 'active' && (now - club.start_date) > 10
        club.status = 'closed'
      end
      self.save
    end
  end

end
