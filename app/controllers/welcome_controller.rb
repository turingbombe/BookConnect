class WelcomeController < ApplicationController
  def index
    @user = User.new
    @upcoming = Club.upcoming[0..5]
    @open = Club.open[0..5]
  end
end
