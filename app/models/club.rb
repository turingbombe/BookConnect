class Club < ApplicationRecord
  has_many :messages
  has_many :user_clubs
  has_many :users, through: :user_clubs
  belongs_to :book, optional: true

  def duration
    return self.end_date=self.s
  end
end
