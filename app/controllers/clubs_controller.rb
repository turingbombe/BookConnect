class ClubsController < ApplicationController

  before_action :set_club, only: [:show, :leave_club, :update]


  def index
    @open_clubs=Club.open
    @archived_clubs=Club.archived
    @upcoming_clubs=Club.upcoming
  end

  def show
    if params[:join] == 'yes' && !@club.users.include?(current_user)
      @club.users << current_user
    end
    title= @club.book.title
    book = GoogleBooks.search(title).first
   end

  def new
    @club = Club.new
    @club.book = Book.find(params[:book_id])
  end

  def create
    club = Club.new(club_params)
    if club.save
      club.users << current_user
      club.status_set
      redirect_to club_path(club)
    else
      render 'new'
    end
  end

  def leave_club
    @club.users(pop(current_user))
  end

  def edit
  end

  def update
    @message= Message.create(content: params[:club][:message][:content], user: current_user, club: @club)
    ActionCable.server.broadcast 'messages',
       message: @message.content,
       user: @message.user.name,
       date: @message.post_time
       head :ok
  end

  def club_member?(club)
    logged_in? && club.users.include?(current_user)
  end

private
  def club_params
    params.require(:club).permit(:name, :start_date, :end_date, :book_id)
  end

  def set_club
    @club=Club.find(params[:id])
  end


end
