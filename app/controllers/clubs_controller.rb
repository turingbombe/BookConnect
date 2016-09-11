class ClubsController < ApplicationController

  def index
    @open_clubs=Club.open
    @archived_clubs=Club.archived
    @upcoming_clubs=Club.upcoming
  end

  def show
    @club=Club.find(params[:id])
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
      redirect_to club_path(club)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @club = Club.find(params[:id])
    @message= Message.create(content: params[:club][:message][:content])
    @club.messages << @message
    current_user.messages << @message
    redirect_to club_path(@club)
  end

  def club_member?(club)
    logged_in? && club.users.include?(current_user)
  end
  
private
  def club_params
    params.require(:club).permit(:name, :start_date, :end_date, :book_id)
  end


end
