class User < ApplicationRecord

    has_secure_password
    validates :password, presence: true, :on => :create
    validates_confirmation_of :password

  has_many :user_clubs
  has_many :clubs, through: :user_clubs
  has_many :messages
  has_many :books, through: :clubs

  def current_clubs
      self.clubs.where.not(status: "archived")
  end

  def archived_clubs
      self.clubs.where(status: "archived")
  end



end
