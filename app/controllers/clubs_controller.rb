class ClubsController < ApplicationController

  def show
    @club=Club.find(params[:id])
   end

  def create
  end

  def edit
  end

  def update
    @club = Club.find(params[:id])
    ##want to refactor this:
    @club.messages<<Message.create(content: params[:club][:message][:content])
    redirect_to club_path(@club)
  end



private
  def club_params
    params.require(:club).permit(:name, :message=> [:content])
  end


end
