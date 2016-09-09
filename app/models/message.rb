class Message < ApplicationRecord

  belongs_to :club, optional: true
  belongs_to :user


  def post_time
    self.created_at.strftime('%b, %I')
  end

end
