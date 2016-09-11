class WelcomeController < ApplicationController
  def index
    @user = User.new
    @upcoming = Club.upcoming[0..3]
    @open = Club.open[0..3]
  end
end
