class ClubsController < ApplicationController

  def show
    @club=Club.find(params[:id])
   end

  def new
    @club = Club.new
    @club.book = Book.find(params[:book_id])
  end

  def create
  end

  def edit
  end

  def update
    @club = Club.find(params[:id])
    @message= Message.create(content: params[:club][:message][:content])
    ##want to refactor this:
    @club.messages<<@message
    user=current_user
    user.messages<<@message
    redirect_to club_path(@club)
  end



private
  def club_params
    params.require(:club).permit(:name, :message=> [:content])
  end


end
