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
    current_user.messages<<@message
    @message.user=current_user
    @message.user_id=current_user.id
    binding.pry
    redirect_to club_path(@club)
  end







private
  def club_params
    params.require(:club).permit(:name, :message=> [:content])
  end


end
