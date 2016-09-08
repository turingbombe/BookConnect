class Message < ApplicationRecord
  belongs_to :club, optional: true
  has_one :user, through: :clubs
end
