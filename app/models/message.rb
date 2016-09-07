class Message < ApplicationRecord
  belongs_to :club, optional: true
end
